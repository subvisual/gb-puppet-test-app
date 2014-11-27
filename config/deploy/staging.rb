set :application, 'staging'
set :stage, :staging
set :rails_env, :staging
set :branch, :master
set :deploy_to, '/var/www/staging'

set :foreman_options, {
  app: fetch(:application),
  log: File.join(shared_path, 'log')
}
