#class Users::RegistrationsController < Devise::RegistrationsController
    
 # password = Devise.friendly_token.first(7)
  #if session[:provider].present? && session[:uid].present?
      #@user = User.create(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password"
      #sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    #else
     # @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation]
    #end
  
 #end