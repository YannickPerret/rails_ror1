class CreateTeacherTeachBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :teacher_teach_branches do |t|
      t.references :branch, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
