class Article < ApplicationRecord
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    attachment :image
end