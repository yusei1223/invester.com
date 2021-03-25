class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)#.order(created_at: :desc).limit(3)
    @notifications.where(checked: false).each do |notification|
    notification.update_attributes(checked: true)
    end
  end

  def check
    current_user.passive_notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

    @unchecked_notifications = current_user.passive_notifications.where(checked: false)
  end

end
