json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :name, :owner_id, :owner_type
  json.url gallery_url(gallery, format: :json)
end
