class CreateClassSubjectSemesters < ActiveRecord::Migration[7.1]
  def change
    create_table :class_subject_semesters do |t|
      t.references :school_class, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
