# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"


set :branch, 'main'
set :application, 'gatefix'
set :repo_url, 'git@github.com:stap780/gatefix.git'
set :deploy_to, '/var/www/gatefix'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :format, :pretty
set :log_level, :info
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
after 'deploy:publishing', 'unicorn:restart'




