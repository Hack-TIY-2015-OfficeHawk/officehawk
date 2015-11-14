class Beacon < ActiveRecord::Base
  has_many :alerts
  has_many :employees, through: :alerts

  belongs_to :organization

  # validates_uniqueness_of [:major, :minor], scope: :organization
  # validates_uniqueness_of :name, scope: :organization_id

  validates_presence_of :organization_id, :manjor, :minor, :uuid
end
