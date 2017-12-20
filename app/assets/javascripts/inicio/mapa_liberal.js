function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: { lat: -40, lng: -66 }
  });

  $('#map').css('height', $(window).height() - $('nav.navbar').height());

  serverExports.usuarios.forEach(function(usuario) {
    var marker = new google.maps.Marker({
      position: usuario.location,
      map: map,
      icon: usuario.icon,
      title: usuario.title
    });

    if (usuario.infoWindow) {
      var infowindow = new google.maps.InfoWindow({
        content: usuario.infoWindow
      });

      marker.addListener('click', function() {
        infowindow.open(map, marker);
      });
    }
  })
}
