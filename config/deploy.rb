set :application, 'test-app'
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
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end
