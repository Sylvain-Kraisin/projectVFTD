require 'single_sign_on'

class DiscourseSsoController < ApplicationController
  before_action :authenticate_user! # ensures user must login

  def sso
    secret = ENV["DISCOURSE_SSO_SECRET_KEY"]
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email # from devise
    sso.name = "Score = #{current_user.score}0 Pts" # this is a custom method on the User class
    sso.username = current_user.username # from devise
    sso.avatar_url = "http://viensfairetesdevoirs.com#{current_user.avatar.url(:original)}"
    sso.avatar_force_update = true
    sso.external_id = current_user.id # from devise
    sso.sso_secret = secret



    redirect_to sso.to_url("http://discourse.viensfairetesdevoirs.com/session/sso_login")
  end
end
