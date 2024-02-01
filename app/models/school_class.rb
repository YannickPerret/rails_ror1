class SchoolClass < ApplicationRecord
    has_many :teacher_conduct_school_classes
    has_many :teachers, through: :teacher_conduct_school_classes
end
