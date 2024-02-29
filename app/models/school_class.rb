class SchoolClass < ApplicationRecord
  has_many :school_class_study_branches
  has_many :branches, through: :school_class_study_branches

  has_many :student_contain_school_classes
  has_many :students, through: :student_contain_school_classes, source: :student

  has_many :teacher_conduct_school_classes
  has_many :teachers, through: :teacher_conduct_school_classes, source: :teacher

  def name_with_year
    "#{name} - #{student_contain_school_classes.pluck(:school_year).uniq.join(", ")}"
  end

  def extract_years
    student_contain_school_classes.pluck(:school_year).uniq
  end

end
