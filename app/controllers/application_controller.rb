class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :usuario_actual, :sesion_iniciada?

  protected

  def usuario_actual
    @usuario_actual ||= Usuario.find_by(id: session[:usuario_id])
  end

  def sesion_iniciada?
    usuario_actual.present?
  end
end
