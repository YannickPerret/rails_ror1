class Note < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'user_id'
  has_many :note_evaluate_branches
  has_many :branches, through: :note_evaluate_branches
end
