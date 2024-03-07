class TeacherConductSchoolClass < ApplicationRecord
  belongs_to :school_class
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'
  
end
