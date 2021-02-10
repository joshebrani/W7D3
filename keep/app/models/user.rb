class User < ApplicationRecord
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end
end
