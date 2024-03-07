class Branch < ApplicationRecord
    has_many :branch_histories
  has_many :note_evaluate_branches
  has_many :school_class_study_branches
  has_many :teachers_teach_branches
  has_many :school_classes, through: :school_class_study_branches
end
