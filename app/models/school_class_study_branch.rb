class SchoolClassStudyBranch < ApplicationRecord
  belongs_to :school_class
  belongs_to :branch
end
