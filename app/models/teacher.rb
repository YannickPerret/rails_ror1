class Teacher < User
  has_many :teacher_subjects
  has_many :subjects, through: :teacher_subjects
end
