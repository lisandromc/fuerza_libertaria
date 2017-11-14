$(function() {
  if ($('body').data('action') != 'mapa_liberal')
    return;

  $('#map').css('height', $(window).height() - $('nav.navbar').height());

  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'}}, function(){
    var markers = handler.addMarkers(serverExports.locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
