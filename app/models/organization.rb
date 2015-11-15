class Organization < ActiveRecord::Base
  has_many :employees, dependent: :destroy
  has_many :beacons, dependent: :destroy
  has_many :alerts, through: :employees

  validates_uniqueness_of :name
  validates_presence_of :name, :owner
end
