class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notification, if: :current_end_user

  def after_sign_in_path_for(resource)
    if current_admin
      rails_admin_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def notification
    @notice = current_end_user.passive_notifications.where(checked: false).order('id desc')[0]
  end

end