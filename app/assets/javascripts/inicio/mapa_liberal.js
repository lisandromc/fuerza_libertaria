$(function() {
  if ($('body').data('action') != 'mapa_liberal')
    return;

  $('#map').css('height', $(window).height() - $('nav.navbar').height());

  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'}}, function(){
    var json_array = [
      { lat: 40, lng: -80, name: 'Foo', infowindow: "I'm Foo" },
      { lat: 45, lng: -90, name: 'Bar', infowindow: "I'm Bar" },
      { lat: 50, lng: -85, name: 'Baz', infowindow: "I'm Baz" },
      { lat: -37.908783, lng: -57.51795199999999, name: 'Mar del Plata', infowindow: 'MDP'}
    ];

    var markers = handler.addMarkers(serverExports.locations);
    // _.each(serverExports.locations, function(json, index){
    //   json.marker = markers[index];
    // });
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
