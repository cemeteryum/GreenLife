json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :username, :email, :password_digest, :remember_digest, :admin, :moderator
  json.url user_url(user, format: :json)
end
