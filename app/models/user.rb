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
         validates :nickname, presence: true
end
