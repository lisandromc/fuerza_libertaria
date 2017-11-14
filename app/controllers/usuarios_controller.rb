require 'securerandom'

class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      @usuario.geolocate
      redirect_to root_path, notice: 'Gracias por registrarte, pronto nos pondremos en contacto!'
    else
      render 'new'
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :movil, :domicilio, :localidad,
                                    :profesion, :areas_conocimiento, :activo_mapa_liberal)
  end
end
