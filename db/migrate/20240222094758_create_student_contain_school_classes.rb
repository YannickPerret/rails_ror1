class CreateStudentContainSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :student_contain_school_classes do |t|
      t.references :people, null: false, foreign_key: true
      t.string :school_year
      t.references :schoolClass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
