class CreateClassStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :class_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
