# config valid for current version and patch releases of Capistrano
lock '~> 3.10.0'

server '188.226.166.89', user: 'deploy', roles: [:web, :app, :db], primary: true
set :deploy_to, '/home/deploy/synesthesy'
set :application, 'synesthesy'
set :repo_url, 'https://github.com/ezubairov/synesthesy.git'
set :linked_files, fetch(:linked_files, []).push(*%w{.env.production})
set :linked_dirs, fetch(:linked_dirs, []).push(*%w{tmp log})

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