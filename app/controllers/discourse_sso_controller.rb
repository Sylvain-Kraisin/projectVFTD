require 'single_sign_on'

class DiscourseSsoController < ApplicationController
  before_action :authenticate_user!

  def sso
    secret = ENV["DISCOURSE_SSO_SECRET_KEY"]
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email
    sso.name = "Classe #{current_user.classroom}"
    sso.username = current_user.username
    sso.bio = current_user.bio
    sso.avatar_url = "http://viensfairetesdevoirs.com#{current_user.avatar.url(:original)}"
    sso.avatar_force_update = true
    sso.external_id = current_user.id
    sso.sso_secret = secret



    redirect_to sso.to_url("http://discourse.viensfairetesdevoirs.com/session/sso_login")
  end
end
