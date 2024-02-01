json.extract! student, :id, :firstname, :lastname, :address, :npa, :city, :email, :phoneNumber, :state, :acronym, :school_class_id, :created_at, :updated_at
json.url student_url(student, format: :json)
