json.extract! student, :id, :firstname, :lastname, :address, :npa, :city, :email, :phoneNumber, :status, :acronym, :password_digest, :type, :created_at, :updated_at
json.url person_url(student, format: :json)
