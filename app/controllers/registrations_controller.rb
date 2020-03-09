class RegistrationsController < Devise::RegistrationsController
  after_action :after_signup, only: :create

  protected

  def after_signup
    if resource.persisted?
      redirect_to new_astrology_chart_path
    end
  end
end
