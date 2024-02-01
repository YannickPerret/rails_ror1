class Teacher < ApplicationRecord
    has_many :teacher_conduct_school_classes
    has_many :school_classes, through: :teacher_conduct_school_classes

    def name
        "#{firstname} #{lastname}"
    end
end
