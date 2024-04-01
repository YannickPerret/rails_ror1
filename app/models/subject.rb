# ==============================================================================
# Filename : subject.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class Subject < ApplicationRecord
  has_many :grades
  has_many :teacher_subjects
  has_many :teachers, through: :teacher_subjects
  has_many :class_subject_semesters
  has_many :school_classes, through: :class_subject_semesters
end
