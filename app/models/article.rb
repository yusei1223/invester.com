class Article < ApplicationRecord
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :article_categories
    has_many :categories, through: :article_categories
    attachment :image
   
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
end