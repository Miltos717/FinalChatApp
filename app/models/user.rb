class User < ApplicationRecord
  validates :username,presence: true,length: {minimum: 3,maximum: 15},uniqueness: {case_sensitive: false}
  has_secure_password
  has_many :messages
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: {case_sensitive: false},
            length: {minimum: 5,maximum: 25},format: {with: VALID_EMAIL_REGEX}
end
