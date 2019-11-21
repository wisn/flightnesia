json.extract! user, :id, :firstname, :lastname, :username, :password, :phone, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
