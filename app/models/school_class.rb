class SchoolClass < ApplicationRecord
  has_many :class_students
  has_many :students, through: :class_students
  has_many :class_subject_semesters
  has_many :subjects, through: :class_subject_semesters
end
