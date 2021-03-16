class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :articles, dependent: :destroy
         has_many :inquires, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :follows, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
         has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
         has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :follower
         has_many :followings, through: :relationships, source: :followed
         validates :nickname, presence: true
         attachment :profile_image



         def follow(user_id)
          relationships.create(followed_id: user_id)
         end

         def unfollow(user_id)
          relationships.find_by(followed_id: user_id).destroy
         end

         def following?(user)
            followings.include?(user)
         end

         def create_notification_follow!(current_user)
             temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
           if temp.blank?
             notification = current_user.active_notifications.new(
             visited_id: id,
             action: 'follow'
             )
             notification.save if notification.valid?
           end
         end

end