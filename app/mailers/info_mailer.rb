class InfoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_mailer.form_contact.subject
  #
  def form_contact(contacto)
    @correo = Contact.find(contacto.id)
    @greeting = "Quiere Contactarse con tigo #{contacto.email}"
    #a quien va el correo                   quien lo manda
    mail( to: "jamesgiiraldo@gmail.com", subject: @greeting)
  end
end
