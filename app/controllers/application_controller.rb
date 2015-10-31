class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include HttpAcceptLanguage::AutoLocale
  include Pundit


  protect_from_forgery with: :exception

  protected

 def admin?
   if signed_in?
     redirect_to root_path unless current_user.role == "admin"
   else
     redirect_to root_path
   end
 end

 def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :username
  devise_parameter_sanitizer.for(:sign_up) << :role
 end

end
