class TeacherTeachBranch < ApplicationRecord
  belongs_to :branch
  belongs_to :teacher
end
