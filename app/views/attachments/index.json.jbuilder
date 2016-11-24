json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :owner_id, :owner_type
  json.url attachment_url(attachment, format: :json)
end
