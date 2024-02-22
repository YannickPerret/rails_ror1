class Note < ApplicationRecord
  belongs_to :person
  has_many :note_evaluate_branches

  has_many :branches, through: :note_evaluate_branches
end
