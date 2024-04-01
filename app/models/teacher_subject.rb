# ==============================================================================
# Filename : teacher_subject.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class TeacherSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
end
