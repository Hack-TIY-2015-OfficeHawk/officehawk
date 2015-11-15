class Alert < ActiveRecord::Base
  belongs_to :employee
  belongs_to :beacon

  validates_presence_of :state, :duration, :beacon_id, :employee_id
end
