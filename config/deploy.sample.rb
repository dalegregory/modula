require 'capistrano/ext/multistage'
require 'bundler/capistrano'

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

set :application,         'modula'
set :stages,              %w[ staging production ]
set :default_stage,       'staging'
set :deploy_via,          :remote_cache
set :keep_releases,       5
set :repository,          'git@github.com:dalegregory/modula.git'
set :runner,              :user
set :scm,                 :git
set :scm_verbose,         true
set :user,                USER
set :use_sudo,            false

after 'deploy:finalize_update', 'deploy:additional_symlinks'
after 'deploy:finalize_update', 'deploy:update_version'

namespace :deploy do

  task(:start) {}
  task(:stop)  {}

  task :restart, :roles => :app, except: { no_release: true } do
    run "#{ try_sudo } touch #{ File.join current_path, 'tmp', 'restart.txt' }"
  end

  task :additional_symlinks do
    run "ln -snF #{ deploy_to }/#{ shared_dir }/config/database.yml #{ release_path }/config/database.yml"
  end

  task :require_tag do
    raise "You need to specify a tag number, eg. cap deploy TAG=1.0.0" unless ENV['TAG']
    set :branch, ENV['TAG']
  end

  desc 'Put the deployed version somewhere we can see it'
  task :update_version, :roles => :app do
    version_file = File.join current_release, 'VERSION'
    run "echo #{ branch.inspect } > #{ version_file }"
  end

end
