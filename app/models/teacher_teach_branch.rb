class TeacherTeachBranch < ApplicationRecord
  belongs_to :teacher, class_name: 'Teacher', foreign_key: 'user_id'
  belongs_to :branch
end
