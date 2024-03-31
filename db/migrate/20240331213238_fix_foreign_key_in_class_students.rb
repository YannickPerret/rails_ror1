class FixForeignKeyInClassStudents < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :class_students, :students
    add_foreign_key :class_students, :users, column: :student_id
  end
end
