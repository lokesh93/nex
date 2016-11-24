json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :crypted_password, :password_salt, :persistence_token, :account_type, :admin
  json.url user_url(user, format: :json)
end
