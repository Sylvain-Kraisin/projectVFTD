class UserMailer < ApplicationMailer
  add_template_helper(EmailHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.correction.subject
  #
  def correction reponse
    @reponse = reponse
    @test = Test.find(@reponse.test_id)
    @subject = 'Correction DST ' + @test.video_title
    mail to: reponse.email, subject: @subject
  end

  def acorriger reponse
    @reponse = reponse
    @test = Test.find(@reponse.test_id)
    @user = @reponse.user
    @subject = 'Nouveau DST de ' + @user.username + ' à corriger'
    mail to: "viensfairetesdevoirs@gmail.com", subject: @subject
  end

  def new_test_available (video, user)
    @video = video
    @user = user
    @subject = 'Un nouveau cours ' + @video.console.title + ' est disponible'
    mail to: user.email, subject: @subject
  end

  ### POST mailer ############################
  def new_post_available (post, user)
    @post = post
    @user = user
    @subject = 'Un nouveau livre intitulé ' + @post.title + ' est disponible au CDI'
    mail to: user.email, subject: @subject
  end

  def new_post_request (post, user)
    @post = post
    @user = user
    @subject = 'Un nouveau livre intitulé ' + @post.title + ' est à valider'
    mail to: "viensfairetesdevoirs@gmail.com", subject: @subject
  end

  def post_refused (post, user)
    @post = post
    @user = user
    @subject = 'Votre livre intitulé ' + @post.title + ' à été refusé'
    mail to: user.email, subject: @subject
  end

  def notify_author (comment)
    @comment = comment
    @post = comment.post
    @author_email = @post.user.email
    @subject =  comment.user_username + ' à annoté ton livre'
    mail to: @author_email, subject: @subject
  end
  ### end POST mailers ############################

end
