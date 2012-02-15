require 'bundler/capistrano'
set :default_environment, { "PATH" => "/home/ubuntu/.rbenv/versions/1.9.2-p290/bin:$PATH" }
set :application, "neday"
set :deploy_to, "/home/ubuntu/neday"
set :rails_env, 'production'
set :branch, 'master'
server 'neday.org', :web, :app, :db, :primary => true
set :normalize_asset_timestamps, false

set :use_sudo, false
set :user, "ubuntu"
set :scm, :git
set :repository, "git://github.com/ka8725/neday.git"
set :deploy_via, :checkout

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:update_code", :symlink_config_files

task :symlink_config_files do
  symlinks = {
    "#{shared_path}/config/database.yml" => "#{release_path}/config/database.yml",
    "#{shared_path}/uploads" => "#{release_path}/public/uploads"
  }
  run symlinks.map{|from, to| "ln -nfs #{from} #{to}"}.join(" && ")
  run "chmod -R g+rw #{release_path}/public"
end
