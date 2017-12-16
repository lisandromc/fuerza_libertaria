//= require jquery3
//= require rails-ujs
//= require_tree .

$(function() {
  $('a#reset_password_by_email').on('click', function() {
    data = { email: $('input#iniciar_sesion_email').val() }
    if (!data.email)
      alert('Debe completar la dirección de email para restablecer su password.');
    else {
      if (confirm('Se enviará un correo a "' + data['email'] + '" para restablecer su password. ¿Continuar?')) {
        $('#notification').removeClass('is-hidden is-danger').addClass('is-link');
        $('#notification p').html('<i class="fa fa-cog fa-spin fa-2x fa-fw"></i> Espere, estamos procesando su solicitud.');
        $.post('/usuarios/send_reset_password_by_email', data, function() {
          $('#notification').removeClass('is-hidden').addClass('is-link');
          $('#notification p').text('Se ha enviado un correo a "' + data['email'] + '" para restablecer su password.');
        }).fail(function() {
          $('#notification').removeClass('is-hidden is-link').addClass('is-danger');
          $('#notification p').text('No existe un usuario con ese email o se ha producido un error al enviar un correo a "' +
                                     data['email'] + '" para restablecer el password.');
        });
      }
    }
  });
});
