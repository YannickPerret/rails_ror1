# ==============================================================================
# Filename : semester.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class Semester < ApplicationRecord
  has_many :grades
  has_many :class_subject_semesters
  has_many :school_classes, through: :class_subject_semesters
  has_many :class_students

  def name_and_year
    "#{name} #{year}"
  end

end
