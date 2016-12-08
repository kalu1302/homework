class User < ApplicationRecord

  validates :email, :password_digest, presences: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  
  after_initialization :ensure_token
  
  def ensure_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
  def password
    @password
  end
  
  def password=(password)
    @password = password
    digest = BCrypt::Password.create(password) 
    self.password_digest = digest 
  end
  
  def is_password?(password)
    pass = BCrypt::Password.new(password)
    pass.is_password?(self.password_digest)
  end
  
  def generate_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  def find_by_credentials(email, password)
    user = User.find_by_email(email)
    user if user && user.is_password?(password)
  end
  
end
