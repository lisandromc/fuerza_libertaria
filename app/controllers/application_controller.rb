class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :usuario_actual

  protected

  def usuario_actual
    @usuario_actual ||= Usuario.find_by(id: session[:usuario_id])
  end
end
