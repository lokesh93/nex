json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :conversation_id, :info
  json.url message_url(message, format: :json)
end
