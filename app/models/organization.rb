class Organization < ActiveRecord::Base
  has_many :employees

  validates_uniqueness_of :name
end
