class UsuarioMailer < ApplicationMailer
  def reset_password_by_email(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Restablecer password de acceso')
  end
end
