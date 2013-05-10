before 'deploy:update_code', 'deploy:require_tag' #require specifying a tag before code is updated

# whenever
# https://github.com/javan/whenever
# set :whenever_command,     'bundle exec whenever'
# set :whenever_environment, defer { stage.to_s }
# set :whenever_identifier,  defer { "#{ application }-#{ stage }" }
# require 'whenever/capistrano'
