class CreateSemesters < ActiveRecord::Migration[7.1]
  def change
    create_table :semesters do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
