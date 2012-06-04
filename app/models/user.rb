class User < ActiveRecord::Base
  ROLES = %w[normal admin]
  def role?(base_role)
    if role.nil?
      return false
    end
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  belongs_to :source
  has_and_belongs_to_many :attempts
  has_many :statuses
  attr_accessible :email, :name, :password, :password_confirmation, :source_id
  has_secure_password

  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  validates :name, presence: true,
                    length: {maximum: 50},
                    uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, :presence => true,
                       :length => {minimum: 6},
                       :if => :validate_password?
  validates :password_confirmation, :presence => true,
                                    :if => :validate_password?
  validates :role, :presence => true,
                    :inclusion => {:in => ROLES}
  def validate_password?
    password.present? || password_confirmation.present?
  end
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
