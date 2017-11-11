namespace :nginx do
  %w(status start stop restart).each do |event|
    desc "#{event.capitalize} monit process"
    task event do
      on roles(:all) do
        sudo "/etc/init.d/nginx #{event}"
      end
    end
  end

  desc 'Upload config'
  task :upload_config do
    on roles(:all) do
      upload_config_and_link('nginx_site', '/etc/nginx/sites-enabled/fuerza_libertaria')
    end
  end

  after 'deploy:finished', :upload_config
  after :upload_config, :restart
end
