json.array!(@users) do |user|
  json.extract! user, :id, :email, :encrypted_password, :salt
  json.url user_url(user, format: :json)
end
