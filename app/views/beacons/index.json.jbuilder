json.beacons do
  json.array!(@beacons) do |beacon|
    json.extract! beacon, :id, :uuid, :major, :minor
  end
end
