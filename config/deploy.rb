set :repo_url, 'git://github.com/groupbuddies/gb-puppet-test-app.git'

set :format, :pretty
set :log_level, :debug
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
  desc 'Restart application'
  task :restart do
    invoke 'foreman:stop'
    invoke 'foreman:export'
    invoke 'foreman:restart'
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'
end
