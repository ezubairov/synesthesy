# config valid for current version and patch releases of Capistrano
lock '~> 3.10.0'

server '188.226.166.89', user: 'deploy', roles: [:web, :app, :db], primary: true
set :application, 'synesthesy'
set :deploy_to, "/home/deploy/#{fetch(:application)}"
set :deploy_via, :remote_cache
set :pty, true
set :use_sudo, false
set :repo_url, 'https://github.com/ezubairov/synesthesy.git'
set :linked_files, fetch(:linked_files, []).push(*%w{.env.production config/nginx.conf})
set :linked_dirs, fetch(:linked_dirs, []).push(*%w{tmp log public/uploads})
set :puma_bind,  "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end