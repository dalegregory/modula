role :web, WEBSERVER
role :app, APPSERVER
role :db,  DATABASE, primary: true

set :branch,    ENV['TAG'] || 'master'
set :deploy_to, "/var/app/#{ application }-staging"
