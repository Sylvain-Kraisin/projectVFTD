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
    @user = @reponse.user_username
    @subject = 'Nouveau DST de ' + @user + ' à corriger'
    mail to: "viensfairetesdevoirs@gmail.com", subject: @subject
  end

  def new_test_available (video, user)
    @video = video
    @user = user
    @subject = 'Un nouveau cours ' + @video.console.title + ' est disponible'
    mail to: user.email, subject: @subject
  end

  def notify_author comment
    @comment = comment
    @post = comment.post
    @author_email = User.find_by(username:@post.author).email
    @subject =  comment.user_username + ' à annoter ton livre'
    mail to: @author_email, subject: @subject
  end
end
