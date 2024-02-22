class SchoolClass < ApplicationRecord
    has_many :student_contain_school_classes
  has_many :teacher_conduct_school_classes
  has_many :school_class_study_branches

  has_many :people, through: :student_contain_school_classes
  has_many :teachers, through: :teacher_conduct_school_classes, source: :people

  has_many :branches, through: :school_class_study_branches
end
