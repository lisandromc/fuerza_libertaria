require 'securerandom'

class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      @usuario.geolocate
      session[:usuario_id] = @usuario.id
      redirect_to root_path, notice: 'Gracias por registrarte, pronto nos pondremos en contacto!'
    else
      render 'new'
    end
  end

  def edit
    if !sesion_iniciada? || usuario_actual.id.to_s != params[:id]
      redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
    else
      @usuario = Usuario.find(params[:id])
      render 'edit'
    end
  end

  def update
    if !sesion_iniciada? || usuario_actual.id.to_s != params[:id]
      redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
    else
      @usuario = Usuario.find(params[:id])
      if @usuario.update(usuario_params)
        redirect_to edit_usuario_path(@usuario), notice: 'Perfil actualizado exitosamente.'
      else
        render 'edit'
      end
    end
  end

  def send_reset_password_by_email
    @usuario = Usuario.find_by(email: params[:email])
    if @usuario
      @usuario.prepare_reset_token
      UsuarioMailer.reset_password_by_email(@usuario).deliver_now
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def reset_password_by_email
    @usuario = Usuario.find_by(email: params[:email])
    if @usuario&.reset_token_valid?(params[:reset_token])
      render 'reset_password_by_email'
    else
      redirect_to root_path, alert: 'Token inválido.'
    end
  end

  def reset_password_with_token
    @usuario = Usuario.find_by(email: params[:email])
    if @usuario&.reset_token_valid?(params[:reset_token])
      @usuario.update_attribute(:password, params[:password])
      redirect_to root_path, notice: 'Se restableció su password, por favor intente iniciar sesión.'
    else
      redirect_to root_path, alert: 'No se pudo restablecer el password.'
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :dni, :email, :password, :movil, :domicilio, :localidad,
                                    :profesion, :areas_conocimiento, :activo_mapa_liberal)
  end
end
