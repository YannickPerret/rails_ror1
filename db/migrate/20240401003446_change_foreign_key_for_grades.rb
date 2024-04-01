class ChangeForeignKeyForGrades < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :grades, :students
    add_foreign_key :grades, :users, column: :student_id
  end
end
