require 'single_sign_on'

class DiscourseSsoController < ApplicationController
  before_action :authenticate_user!

  def sso
    secret = ENV["DISCOURSE_SSO_SECRET_KEY"]
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email # from devise
    sso.name = "Classe #{current_user.classroom}" # this is a custom method on the User class
    sso.username = current_user.username # from devise
    #sso.bio TODO NEED TO IMPLEMENT THIS
    sso.avatar_url = "http://viensfairetesdevoirs.com#{current_user.avatar.url(:original)}"
    sso.avatar_force_update = true
    sso.external_id = current_user.id # from devise
    sso.sso_secret = secret



    redirect_to sso.to_url("http://discourse.viensfairetesdevoirs.com/session/sso_login")
  end
end
