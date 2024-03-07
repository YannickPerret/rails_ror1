class CreateSchoolClassStudyBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :school_class_study_branches do |t|
      t.references :school_class, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
