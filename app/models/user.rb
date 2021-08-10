class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  # validates :password, confirmation: true
  # validates :api_key, uniqueness: true
end
