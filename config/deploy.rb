set :repo_url, 'git://github.com/groupbuddies/gb-puppet-test-app.git'

server '178.62.191.139', user: 'deploy', roles: %w{web app db}, primary: true
set :ssh_options, { forward_agent: true }

set :format, :pretty
set :log_level, :info
set :pty, true

set :rvm_ruby_version, '2.1.5'

set :linked_files, %w{.env}
set :linked_dirs,  %w{log public/system}

set :bundle_without, %w(development test deploy).join(' ')
set :keep_releases, 3

set :foreman_user_sudo, true
set :foreman_export_path, '/home/deploy/.init'
set :foreman_options, {
  user: 'deploy'
}

namespace :deploy do
  task :stop do
    begin
      invoke 'foreman:stop'
    rescue
    end
  end

  desc 'Restart application'
  task :restart do
    invoke 'deploy:stop'
    invoke 'foreman:export'
    invoke 'foreman:start'
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'
end
