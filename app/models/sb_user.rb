class SbUser < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  # Returns the hash digest of the given string.
  def SbUser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    SbuserMailer.sbuser_activate(self).deliver_now
  end
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = SbUser.new_token
    update_attribute(:reset_digest,  SbUser.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    SbuserMailer.password_reset(self).deliver_now
  end

  # Returns a random token.
  def SbUser.new_token
    SecureRandom.urlsafe_base64
  end
# Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = SbUser.new_token
    update_attribute(:remember_digest, SbUser.digest(remember_token))
  end
# Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
# Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = SbUser.new_token
      self.activation_digest = SbUser.digest(activation_token)
    end

end
