json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :email, :content, :fist_name, :last_name, :feedback_type
  json.url feedback_url(feedback, format: :json)
end
