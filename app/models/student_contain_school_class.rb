class StudentContainSchoolClass < ApplicationRecord
  belongs_to :school_class, optional: true
  belongs_to :student, foreign_key: 'user_id', class_name: 'User', optional: true
end
