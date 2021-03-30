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

  def ban_deleted_user
    if current_end_user && current_end_user.status == 2
      flash[:error] = "利用停止アカウントです。"
      redirect_to root_path
    end
  end

  def ban_ristricted_user
    if current_end_user && current_end_user.status == 1
      flash[:error] = "機能制限中のアカウントです。"
      redirect_to root_path
    end
  end

end