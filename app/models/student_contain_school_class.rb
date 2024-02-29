class StudentContainSchoolClass < ApplicationRecord
  belongs_to :school_class
  belongs_to :student, foreign_key: 'user_id', class_name: 'User'
end
