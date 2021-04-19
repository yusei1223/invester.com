class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    redirect_to new_user_registration_path
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).reverse_order
    @users
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end
end
