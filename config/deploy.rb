set :repo_url, 'git://github.com/naps62/the_well_provisioned_test_app'

server 'localhost', user: 'deploy', roles: %w{web app db}, primary: true

set :default_shell, 'bash -l'
set :ssh_options, { port: 2222, forward_agent: true }

set :format, :pretty
set :log_level, :info
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs,  %w{log public/system}

set :keep_releases, 3

namespace :deploy do
  desc 'Restart application'
  task :restart => 'monit:restart'

  after :finishing, 'deploy:cleanup'
end
