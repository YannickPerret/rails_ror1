json.extract! person, :id, :firstname, :lastname, :address, :npa, :city, :email, :phoneNumber, :status, :acronym, :password_digest, :role_id, :created_at, :updated_at
json.url person_url(person, format: :json)
