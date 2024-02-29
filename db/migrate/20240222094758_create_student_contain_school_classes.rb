class CreateStudentContainSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :student_contain_school_classes do |t|
      t.references :person, null: false, foreign_key: true
      t.references :schoolClass, null: false, foreign_key: true
      t.string :school_year


      t.timestamps
    end
  end
end
