namespace :deploy do
  desc "Upload configs files"
  task :upload_config do
    on roles(:app) do |host|
      invoke 'monit:upload_config'
      invoke 'nginx:upload_config'
    end
  end
end

def upload_config_and_link(template, link_to)
  upload_config(template)
  link_file(template, link_to)
end

def upload_config(template)
  upload! render_template("config/deploy/templates/#{template}.erb"), File.join(shared_path, template)
end

def render_template(local_path)
  StringIO.new(ERB.new(File.read(local_path)).result(binding))
end

def link_file(filename, link_to)
  sudo "ln -nfs #{File.join(shared_path, filename)} #{link_to}"
end
