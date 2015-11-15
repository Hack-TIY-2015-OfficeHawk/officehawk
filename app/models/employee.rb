class Employee < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_secure_password
  has_many :alerts, dependent: :destroy
  belongs_to :organization
  has_many :beacons, through: :alerts
  # has_many :organizations, through: :alerts

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
    while Employee.exists?(auth_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
