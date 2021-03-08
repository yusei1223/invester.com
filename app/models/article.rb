class Article < ApplicationRecord
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    attachment :image
end