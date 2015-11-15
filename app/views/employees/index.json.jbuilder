json.employees do
  json.array!(@employees) do |employee|
  json.id employee.id
  json.username employee.username
  json.gravatar_url employee.email.nil? ? random_pic : employee.gravatar_url
  end
end

