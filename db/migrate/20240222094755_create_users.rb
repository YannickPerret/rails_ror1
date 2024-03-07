class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.integer :npa
      t.string :city
      t.string :email
      t.string :phoneNumber
      t.string :acronym
      t.string :password_digest
      t.boolean :status
      t.string :type

      t.timestamps
    end
  end
end
