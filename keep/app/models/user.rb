class User < ApplicationRecord
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}

  attr_accessor :password
end
