threads 4, 8
bind "unix://tmp/sockets/puma.sock"
daemonize true
pidfile "tmp/pids/puma.pid"
state_path "tmp/pids/puma.state"
plugin :tmp_restart

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
