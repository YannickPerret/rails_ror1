# ==============================================================================
# Filename : student.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class Student < User
  has_many :class_students
  has_many :school_classes, through: :class_students
  has_many :grades
  belongs_to :semester, optional: true

end
