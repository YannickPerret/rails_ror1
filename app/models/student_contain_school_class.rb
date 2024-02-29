class StudentContainSchoolClass < ApplicationRecord
  belongs_to :person
  belongs_to :schoolClass
end
