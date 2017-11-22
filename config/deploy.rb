# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "fuerza_libertaria"
set :repo_url, "https://github.com/vizcay/fuerza_libertaria.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/vizcay/applications/fuerza_libertaria"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/secrets.yml.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_conf, "#{current_path}/config/puma/production.rb"

append :rbenv_map_bins, 'puma', 'pumactl'
append :bundle_bins, 'puma', 'pumactl'
