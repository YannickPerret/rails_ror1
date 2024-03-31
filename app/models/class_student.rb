class ClassStudent < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :school_class
  belongs_to :semester
end