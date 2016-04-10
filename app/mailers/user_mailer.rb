class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.correction.subject
  #
  def correction reponse
    @reponse = reponse
    mail to: reponse.email, subject: 'Ton devoir à été corrigé'
  end

  def acorriger reponse
    @reponse = reponse
    mail to: "viensfairetesdevoirs@gmail.com", subject: 'Nouveau Devoir à corriger'
  end
end
