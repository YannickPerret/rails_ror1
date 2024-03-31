class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :phone
      t.integer :npa
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
