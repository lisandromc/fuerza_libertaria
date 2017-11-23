class SesionController < ApplicationController
  def iniciar
    @usuario = Usuario.find_by(email: params[:email])
    if @usuario&.password_digest.blank?
      redirect_to root_path, alert: "El usuario no tiene un password establecido, por favor utilizar la función de restablecer."
    elsif @usuario&.authenticate(params[:password])
      session[:usuario_id] = @usuario.id
      redirect_to root_path, notice: "Bienvenido #{@usuario.nombre}."
    else
      redirect_to root_path, alert: "Email o password incorrecto."
    end
  end

  def cerrar
    if usuario_actual
      session[:usuario_id] = nil
      redirect_to root_path, notice: "Sesión cerrada."
    else
      redirect_to root_path
    end
  end
end
