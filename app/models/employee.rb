class Employee < ActiveRecord::Base
  has_secure_password
  has_many :alerts
  belongs_to :organization

  before_validation :ensure_auth_token

  validates_presence_of :username, :password_digest, :organization_id
  validates_uniqueness_of :username, scope: :organization_id

  def ensure_auth_token
    if self.auth_token.blank?
      self.auth_token = Employee.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(auth_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
