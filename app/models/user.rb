class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: {within: 2..50}
  validates :email, presence: true, format: {with: EMAIL_REGEX, message: "Thats not a real email!"}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {within: 6..20}
  before_save {self.email = email.downcase}
end
