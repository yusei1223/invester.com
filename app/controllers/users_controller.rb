class UsersController < ApplicationController
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

 def user_params
    params.require(:user).permit(:nickname, :profile_image)
 end

end