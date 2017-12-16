json.usuarios Usuario.select(&:localizar_en_mapa?) do |usuario|
  json.location usuario.location
  if sesion_iniciada?
    json.infoWindow ApplicationController.render(partial: 'inicio/usuario_infowindow', locals: { usuario: usuario })
  end
end
