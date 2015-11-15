class Organization < ActiveRecord::Base
  has_many :employees
  has_many :beacons

  validates_uniqueness_of :name
  validates_presence_of :name, :owner
end
