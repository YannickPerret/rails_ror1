class Person < ApplicationRecord
  belongs_to :role
  has_many :notes
  has_many :student_contain_school_classes
  has_many :teacher_conduct_school_classes
  has_many :people_teach_branches

  has_many :school_classes, through: :student_contain_school_classes
  has_many :taught_school_classes, through: :teacher_conduct_school_classes, source: :school_class
  has_many :taught_branches, through: :people_teach_branches, source: :branch

  def name
    "#{firstname} #{lastname}"
  end
end
