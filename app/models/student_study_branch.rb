class StudentStudyBranch < ApplicationRecord
  belongs_to :student
  belongs_to :branch
end
