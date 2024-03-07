class CreateTeacherConductSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :teacher_conduct_school_classes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: {to_table: :school_classes}

      t.timestamps
    end
  end
end
