json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :member_count, :owner
  json.url organization_url(organization, format: :json)
end
