class CreateStudentContainSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :student_contain_school_classes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :school_class, null: true, foreign_key: {to_table: :school_classes} 
      t.string :school_year


      t.timestamps
    end
  end
end
