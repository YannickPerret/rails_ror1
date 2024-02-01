class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.integer :npa
      t.string :city
      t.string :email
      t.string :phoneNumber
      t.string :state
      t.string :acronym
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
