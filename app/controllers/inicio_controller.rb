class InicioController < ApplicationController
  def inicio
  end

  def mapa_liberal
    gon.locations = Usuario.map_locations_json
  end
end
