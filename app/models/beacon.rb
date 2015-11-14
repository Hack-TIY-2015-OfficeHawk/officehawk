class Beacon < ActiveRecord::Base
  has_many :alerts
  has_many :employees, through: :alerts
end
