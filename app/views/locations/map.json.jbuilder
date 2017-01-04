json.location do
  json.array! @locations do |loc|
    json.address loc, :address, :longitude, :latitude
  end
end