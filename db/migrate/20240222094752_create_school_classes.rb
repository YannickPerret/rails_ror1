class CreateSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :school_classes do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
