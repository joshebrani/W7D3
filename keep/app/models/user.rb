class User < ApplicationRecord
  validates :password_digest, presence: true
  validates :session_token, :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    token = SecureRandom::urlsafe_base64
  end
  
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  

  
end
