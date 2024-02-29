class Student < User
  has_many :student_contain_school_classes, foreign_key: 'user_id'
  has_many :school_classes, through: :student_contain_school_classes
  accepts_nested_attributes_for :student_contain_school_classes

  has_many :notes

  def name_with_school_classes
    "#{first_name} #{last_name} - #{school_classes.map(&:name).join(", ")}"
  end
  
end