class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource  

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :username, :image) }
  end

  # Make devise edit to use admin layout
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "edit"
      "admin/application"
    elsif devise_controller? && resource_name == :user && action_name == "new"
      "login_registration"
    else
      "application"
    end
  end
end
