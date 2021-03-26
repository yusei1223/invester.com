class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to articles_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def after_sign_in_path_for(resource)
    articles_path(resource) # ログイン後に遷移するpathを設定
  end
end
