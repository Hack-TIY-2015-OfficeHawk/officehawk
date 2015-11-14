class Beacon < ActiveRecord::Base
  has_many :alerts
end
