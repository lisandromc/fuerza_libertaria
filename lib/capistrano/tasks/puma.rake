namespace :puma do
  after 'deploy:finished', 'puma:restart'

  desc 'start puma'
  task :start do
    on roles(:app) do
      if puma_running?
        info 'Puma already running'
      else
        within current_path do
          with rack_env: 'production' do
            execute :puma, "-C #{fetch(:puma_conf)} --daemon"
          end
        end
      end
    end
  end

  %w[halt stop status].map do |command|
    desc "#{command} puma"
    task command do
      on roles(:app) do
        within current_path do
          if puma_running?
            with rack_env: 'production' do
              execute :pumactl, "--pidfile #{fetch(:puma_pid)} #{command}"
            end
          else
            warn 'Puma not running'
          end
        end
      end
    end
  end

  %w[phased-restart restart].map do |command|
    desc "#{command} puma"
    task command do
      on roles(:app) do
        within current_path do
          if puma_running?
            with rack_env: 'production' do
              execute :pumactl, "--pidfile #{fetch(:puma_pid)} -F #{fetch(:puma_conf)} #{command}"
            end
          else
            puts '** WARNING **'
            puts 'Puma is not running or not detected'
            invoke 'puma:start'
          end
        end
      end
    end
  end
end

def puma_running?
  test("[ -f #{fetch(:puma_pid)} ]") && test(:kill, "-0 $( cat #{fetch(:puma_pid)} )")
end
