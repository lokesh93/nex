json.array!(@service_locations) do |service_location|
  json.extract! service_location, :id, :vendor_id, :city_id
  json.url service_location_url(service_location, format: :json)
end
