class Alert < ActiveRecord::Base
  belongs_to :employee
  belongs_to :beacon
end
