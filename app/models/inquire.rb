class Inquire < ApplicationRecord
  validates :nickname, presence: true
  validates :email, presence: true
  validates :body, presence: true
end
