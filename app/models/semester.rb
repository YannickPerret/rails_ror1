class Semester < ApplicationRecord
  has_many :grades
  has_many :class_subject_semesters
  has_many :school_classes, through: :class_subject_semesters
end
