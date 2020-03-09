class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # For additional fields in app/views/devise/registrations/new.html.erb and edit.html.erb
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password) }
  end

  def after_sign_up_path_for(resource_or_scope)
    new_astrology_chart_path
  end
end
