# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# Création d'un élève
Student.create!(
  firstname: "John",
  lastname: "Doe",
  email: "dev@dev.com",
  password: "admin",
  password_confirmation: "admin"
)

puts "Élève créé : dev@dev.com / admin"

# Création d'un professeur
Teacher.create!(
  firstname: "Jane",
  lastname: "Smith",
  email: "prof@prof.com",
  password: "admin",
  password_confirmation: "admin"
)

puts "Professeur créé : prof@prof.com / admin"

# Création d'un superviseur
Supervisor.create!(
  firstname: "Robert",
  lastname: "Johnson",
  email: "sup@sup.com",
  password: "admin",
  password_confirmation: "admin"
)

puts "Superviseur créé : sup@sup.com / admin"
