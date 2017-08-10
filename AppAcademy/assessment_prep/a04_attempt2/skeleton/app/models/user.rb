class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, allow_nil: true, length: {minimum: 6}

  before_validation :ensure_session_token

  has_many :links,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Link"

  has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Comment"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return nil if user.nil?

    if user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

end
