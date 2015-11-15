json.alert @alerts do |alert|
  json.id alert.id
  json.state alert.state
  json.beacon_id alert.beacon_id
  json.beacon_uuid alert.beacon.uuid
  json.beacon_minor alert.beacon.minor
  json.beacon_major alert.beacon.major
  json.duration alert.duration
end
