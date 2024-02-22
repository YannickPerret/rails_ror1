class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.integer :npa
      t.string :city
      t.string :email
      t.string :phoneNumber
      t.boolean :status
      t.string :acronym
      t.string :password_digest
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
