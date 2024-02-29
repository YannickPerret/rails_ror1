class Teacher < User 
  has_many :teacher_conduct_school_classes, foreign_key: 'user_id'
  has_many :school_classes, through: :teacher_conduct_school_classes

  has_many :teacher_teach_branches

  def conducted_school_classes
    SchoolClass.joins(:teacher_conduct_school_classes).where(teacher_conduct_school_classes: { user_id: id })
  end
end