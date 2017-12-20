json.usuarios Usuario.select(&:localizar_en_mapa?) do |usuario|
  json.location usuario.location
  if sesion_iniciada?
    json.infoWindow ApplicationController.render(partial: 'inicio/usuario_infowindow', locals: { usuario: usuario })
    if usuario == usuario_actual
      json.title 'Yo'
      json.icon 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
    elsif usuario.any_public_data?
      json.title 'Liberal'
      json.icon 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
    else
      json.title 'Liberal anónimo'
      json.icon 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
    end
  end
end
