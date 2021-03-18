class Inquire < ApplicationRecord
    validates :nickname, presence: true
    validates :email, presence: true, length: {maximum:255}
    validates :body, presence: true
end
