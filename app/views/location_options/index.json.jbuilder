json.array!(@location_options) do |location_option|
  json.extract! location_option, :id, :name
  json.url location_option_url(location_option, format: :json)
end
