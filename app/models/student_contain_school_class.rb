class StudentContainSchoolClass < ApplicationRecord
  belongs_to :people
  belongs_to :schoolClass
end
