class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
    notification.update_attributes(checked: true)
    end
     notifications = @notifications.where.not(visitor_id: current_user.id) 
     puts "テスト"
     puts notifications.exists? 
  end

end