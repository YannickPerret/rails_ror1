# ==============================================================================
# Filename : teacher.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class Teacher < User
  has_many :teacher_subjects
  has_many :subjects, through: :teacher_subjects
end
