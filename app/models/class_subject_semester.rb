# ==============================================================================
# Filename : class_subject_semester.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class ClassSubjectSemester < ApplicationRecord
  belongs_to :school_class
  belongs_to :subject
  belongs_to :semester
end
