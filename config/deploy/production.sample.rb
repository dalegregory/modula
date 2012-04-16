before 'deploy:update_code', 'deploy:require_tag' #require specifying a tag before code is updated

role :web, WEBSERVER
role :app, APPSERVER
role :db,  DATABASE, primary: true

set :deploy_to, "/var/app/#{ application }"
