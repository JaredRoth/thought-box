class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,           presence: true, uniqueness: true
  validates :email,           format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }, allow_nil: true
end
