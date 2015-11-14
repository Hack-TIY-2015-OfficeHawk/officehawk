json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :password, :organization, :admin
  json.url employee_url(employee, format: :json)
end
