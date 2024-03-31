class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :semester
end
