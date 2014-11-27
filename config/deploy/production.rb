set :application, 'production'
set :stage, :production
set :rails_env, :production
set :branch, :master
set :deploy_to, '/var/www/production'

set :foreman_options, {
  app: fetch(:application),
  log: File.join(shared_path, 'log')
}
