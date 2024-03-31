class Student < User
  has_many :class_students
  has_many :school_classes, through: :class_students
  has_many :grades
end
