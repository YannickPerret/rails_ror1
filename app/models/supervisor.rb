class Supervisor < User 
    has_many :teacher_conduct_school_classes
  has_many :taught_school_classes, through: :teacher_conduct_school_classes, source: :school_class
  has_many :people_teach_branches
  has_many :taught_branches, through: :people_teach_branches, source: :branch

end