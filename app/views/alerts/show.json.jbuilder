json.alert do 
  json.id @alert.id
  json.state @alert.state
  json.beacon_id @alert.beacon_id
  json.employee_id @alert.employee_id
  json.duration @alert.duration
end
