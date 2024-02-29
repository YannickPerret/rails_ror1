class AddPolymorphismeToPeople < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :rollable_id, :integer
    add_column :people, :rollable_type, :string
    add_index :people, [:rollable_id, :rollable_type]
  end
end
