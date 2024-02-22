class CreateTeacherConductSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :teacher_conduct_school_classes do |t|
      t.references :people, null: false, foreign_key: true
      t.references :schoolClass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
