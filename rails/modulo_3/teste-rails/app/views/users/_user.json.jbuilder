json.extract! user, :id, :user_name, :last_name, :idade, :created_at, :updated_at
json.url user_url(user, format: :json)
