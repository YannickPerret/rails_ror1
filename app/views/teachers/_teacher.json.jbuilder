json.extract! teacher, :id, :firstname, :lastname, :email, :phoneNumber, :address, :city, :nip, :acronym, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
