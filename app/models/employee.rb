class Employee < ActiveRecord::Base
  has_many :alerts
  belongs_to :organization
end
