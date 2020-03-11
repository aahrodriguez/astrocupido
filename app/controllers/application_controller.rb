class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :dispatch_user

  # For additional fields in app/views/devise/registrations/new.html.erb and edit.html.erb
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password) }
  end


  def dispatch_user
    return unless current_user && request.get?
    path = new_astrology_chart_path unless current_user.astrology_chart.present?
    path = all_users_path if request.path == root_path
    redirect_to path unless path.nil? || path == request.path
  end
end
