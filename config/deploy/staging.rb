set :application, 'staging'
set :stage, :staging
set :rails_env, :staging
set :branch, :master
set :deploy_to, '/var/www/staging'

server 'localhost', user: 'deploy', roles: %w{web app db}, primary: true

set :default_shell, 'bash -l'
set :ssh_options, { port: 2222, forward_agent: true }
