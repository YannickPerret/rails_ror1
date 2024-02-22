class SchoolClassStudyBranch < ApplicationRecord
  belongs_to :schoolClass
  belongs_to :branch
end
