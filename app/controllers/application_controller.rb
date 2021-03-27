class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_seach
  before_action :set_notification

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def set_seach
    @search = Article.ransack(params[:q])
  end

  def set_notification
    @current_user_notification ||= []
    if user_signed_in?
      @current_user_notification = current_user.passive_notifications.order('updated_at DESC').limit(3)
    end
  end
end
