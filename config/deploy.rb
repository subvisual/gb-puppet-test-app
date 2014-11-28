set :repo_url, 'git://github.com/groupbuddies/gb-puppet-test-app.git'

set :format, :pretty
set :log_level, :debug
set :pty, true

set :rvm_ruby_version, '2.1.5'

set :linked_files, %w{.env}
set :linked_dirs,  %w{log public/system}

set :bundle_without, %w(development test deploy).join(' ')
set :keep_releases, 3

set :foreman_export_path, '/home/deploy/.init'

namespace :deploy do
  desc 'Restart application'
  after :finishing, 'deploy:cleanup'
  after :finishing, 'foreman:export'

  task :test do
    puts fetch(:rvm_map_bins)
  end
end
