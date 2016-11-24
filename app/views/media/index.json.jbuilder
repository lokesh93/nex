json.array!(@media) do |medium|
  json.extract! medium, :id, :owner_id, :owner_type
  json.url medium_url(medium, format: :json)
end
