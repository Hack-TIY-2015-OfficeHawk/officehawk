class Employee < ActiveRecord::Base
  has_many :alerts
  belongs_to :organization
  has_many :beacons, through: :alerts
end
