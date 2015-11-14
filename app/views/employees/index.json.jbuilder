json.employees do
  json.array!(@employees) do |employee|
  json.extract! employee, :id, :username
  end
end

