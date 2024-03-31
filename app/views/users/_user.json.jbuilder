json.extract! user, :id, :type, :lastname, :firstname, :email, :password_digest, :address, :phone, :npa, :city, :country, :created_at, :updated_at
json.url user_url(user, format: :json)
