$(function() {
  if ($('body#usuarios_index').length) {
    $('a.convertir_coordinador').on('ajax:success', function(event) {
      $(event.currentTarget).closest('tr').find('i.coordinador').removeClass('is-hidden');
      $(event.currentTarget).closest('td.acciones').find('a').hide();
    });

    $('a.convertir_referente').on('ajax:success', function(event) {
      $(event.currentTarget).closest('tr').find('i.referente').removeClass('is-hidden');
      $(event.currentTarget).closest('td.acciones').find('a').hide();
    });

    $('a.remover_privilegios').on('ajax:success', function(event) {
      $(event.currentTarget).closest('tr').find('i.coordinador, i.referente').hide();
      $(event.currentTarget).closest('td.acciones').find('a').hide();
    })
  }
});
