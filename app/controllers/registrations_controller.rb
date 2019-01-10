class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
                                     keys: %I[email password password_confirmation current_password expedition_id])
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %I[email password password_confirmation expedition_id])
  end
end
