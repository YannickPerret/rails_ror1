class CreateSchoolClassStudyBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :school_class_study_branches do |t|
      t.references :schoolClass, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
