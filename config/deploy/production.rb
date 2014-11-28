set :application, 'production'
set :stage, :production
set :rails_env, :production
set :branch, :master
set :deploy_to, '/var/www/production'

server '128.199.51.99', user: 'deploy', roles: %w{web app db}, primary: true

set :ssh_options, { forward_agent: true }
