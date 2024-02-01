class CreateStudentStudyBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :student_study_branches do |t|
      t.references :student, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
