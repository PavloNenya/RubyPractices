class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  # Customize redirection after email confirmation
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # Automatically sign in the user after confirmation
    new_session_path(resource_name) # Redirect to a new session (sign in) path
  end
end