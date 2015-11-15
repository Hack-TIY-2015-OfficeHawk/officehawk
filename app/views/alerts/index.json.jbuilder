json.alert @alerts do |alert|
  json.id alert.id
  json.state alert.state
  json.beacon_id alert.beacon_id
  json.employee alert.employee.username
  json.employee_id alert.employee.id
  json.duration alert.duration
end
