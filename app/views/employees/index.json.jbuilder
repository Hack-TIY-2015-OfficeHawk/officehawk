json.employees do
  json.array!(@employees) do |employee|
  json.extract! employee, :id, :username,:gravatar_url
  end
end

