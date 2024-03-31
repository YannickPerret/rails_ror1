class ClassSubjectSemester < ApplicationRecord
  belongs_to :school_class
  belongs_to :subject
  belongs_to :semester
end
