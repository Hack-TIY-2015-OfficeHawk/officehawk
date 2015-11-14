json.array!(@alerts) do |alert|
  json.extract! alert, :id, :beacon, :state, :duration, :employee_id
  json.url alert_url(alert, format: :json)
end
