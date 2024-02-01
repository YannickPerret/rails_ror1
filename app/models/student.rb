class Student < ApplicationRecord
  belongs_to :school_class

  def name
    "#{firstname} #{lastname}"
  end
end
