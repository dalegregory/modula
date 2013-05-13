require 'dotenv'
require 'bundler/capistrano'
require 'capistrano/campfire'
require 'capistrano/ext/multistage'
require 'rvm/capistrano'

Dotenv.load

role :app, ENV['DEPLOY_APP']
role :db,  ENV['DEPLOY_DB'], primary: true
role :web, ENV['DEPLOY_WEB']

default_run_options[:env]   = { 'RAILS_ENV' => fetch :rails_env }
default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

set :application,        'modula'
set :stages,             %w[ staging production ]
set :default_stage,      'staging'
set :deploy_to,          defer { "/Users/#{ user }/app/#{ application }-#{ stage }" }
set :deploy_via,         :remote_cache
set :keep_releases,      10
set :repository,         'git@github.com:dalegregory/modula.git'
set :rails_env,          defer { stage.to_s }
set :runner,             :user
set :scm,                :git
set :scm_verbose,        false
set :server_config_path, '/Library/Server/Web/Config/apache2'
set :shared_children,    fetch(:shared_children) + %w[ private ]
set :tld,                ENV['DEPLOY_TLD']
set :user,               USER
set :use_sudo,           false

set :campfire_options, account: ENV['CAMPFIRE_DOMAIN'],
                       room:    ENV['CAMPFIRE_ROOM'],
                       ssl:     true,
                       token:   ENV['CAMPFIRE_TOKEN']

set :dependencies, defer {{
  'remote' => {
    'file' => %W[
      #{ shared_path }/config/database.yml
      #{ shared_path }/config/#{ stage }.env
      #{ server_config_path }/rails_#{ application }-#{ stage }.conf
      #{ server_config_path }/sites/0000_any_80_#{ application }-#{ stage }.#{ tld }.conf
    ],
  }
}}

set :rvm_ruby_string,  defer { "#{ ENV['RUBY_VERSION'] }@#{ application }-#{ stage }"}
set :rvm_install_ruby, :install # only install ruby if necessary
set :rvm_install_type, :stable  # do not use unstable versions of RVM
set :rvm_type,         :user    # do not use system rvm

before 'deploy:setup',           *%w[ rvm:install_rvm rvm:install_ruby deploy:create_config_dir ]
after  'deploy:update_code',     'deploy:upgrade_latest'
after  'deploy:restart',         'deploy:campfire_notice'
after  'deploy:finalize_update', *%w[ deploy:additional_symlinks deploy:cleanup deploy:log_branch ]

namespace :deploy do

  task(:start) {}
  task(:stop)  {}

  task :create_config_dir do
    run "#{ try_sudo } mkdir -p #{ File.join shared_path, 'config' }"
  end

  desc <<-DESC
    Deploys and starts a `cold' application. This is useful if you have not \
    deployed your application before, or if your application is (for some \
    other reason) not currently running. It will deploy the code, set up \
    the database, and then instead of invoking `deploy:restart', it will \
    invoke `deploy:start' to fire up the application servers.
  DESC
  task :cold do
    update
    db_setup
    start
  end

  desc <<-DESC
    Run the db:setup rake task. By default, it runs this in most recently \
    deployed version of the app. Strings will work for those values \
    instead of symbols, too. You can also specify additional environment \
    variables to pass to rake via the setup_env variable. Finally, you \
    can specify the full path to the rake executable by setting the rake \
    variable.

    The defaults are:

      set :rails_env, 'production'
      set :rake,      'bundle exec rake'
      set :setup_env, ''
  DESC
  task :db_setup, roles: :db, only: { primary: true } do
    rails_env = fetch :rails_env,   'production'
    rake      = fetch :rake,        "#{ fetch :bundle_cmd, 'bundle' } exec rake"
    setup_env = fetch :migrate_env, ''

    run "cd #{ latest_release } && RAILS_ENV=#{ rails_env } #{ setup_env } #{ rake } db:setup"
  end

  task :restart, :roles => :app, except: { no_release: true } do
    run "#{ try_sudo } touch #{ File.join current_path, 'tmp', 'restart.txt' }"
  end

  task :additional_symlinks do
    run "ln -snF #{ deploy_to }/#{ shared_dir }/config/database.yml   #{ release_path }/config/database.yml"
    run "ln -snF #{ deploy_to }/#{ shared_dir }/config/#{ stage }.env #{ release_path }/.env"
  end

  desc 'Log the branch that was deployed from'
  task :log_branch, :roles => :app do
    path = File.join current_release, 'BRANCH'
    run "echo #{ branch.inspect } > #{ path }"
  end

  task :require_tag do
    raise 'You need to specify a tag number, eg. cap deploy TAG=1.0.0' unless ENV['TAG']
    set :branch, ENV['TAG']
  end

  desc 'Run the upgrade:latest rake task'
  task :upgrade_latest do
    run "cd '#{ release_path }' && #{ fetch :rake } upgrade:latest"
  end

  desc 'Post Notice in Campfire'
  task :campfire_notice do
    name = `git config user.name`
    sha  = `git rev-parse #{ branch }`

    campfire_room.speak "#{ name } deployed #{ branch }@#{ sha[0..7] } to #{ application }-#{ stage }"
    campfire_room.play ENV['CAMPFIRE_SOUND'] if ENV['CAMPFIRE_SOUND']
  end

end
