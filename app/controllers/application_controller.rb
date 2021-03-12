class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_seach

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  
  def set_seach
   @search = Article.ransack(params[:q])
   @search_article = @search.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page]).per(5)
  end

end
