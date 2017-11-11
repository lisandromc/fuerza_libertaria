namespace :monit do
  desc 'Monit status'
  task :status do
    on roles(:all) do
      sudo 'monit status'
    end
  end

  %w(start stop restart).each do |event|
    desc "#{event.capitalize} monit process"
    task event do
      on roles(:all) do
        sudo "/etc/init.d/monit #{event}"
      end
    end
  end

  desc 'Upload config'
  task :upload_config do
    on roles(:all) do
      upload_config_and_link('monit_config', '/etc/monit/conf-enabled/fuerza_libertaria')
    end
  end

  after 'deploy:finished', :upload_config
  after :upload_config, :restart
end
