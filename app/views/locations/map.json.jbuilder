json.location do
  json.array! @location do |loc|
    json.address loc, :address, :longitude, :latitude
  end
end