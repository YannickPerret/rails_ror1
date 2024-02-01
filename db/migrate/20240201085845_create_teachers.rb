class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phoneNumber
      t.string :address
      t.string :city
      t.integer :nip
      t.string :acronym

      t.timestamps
    end
  end
end
