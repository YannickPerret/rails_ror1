class CreateBranchHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :branch_histories do |t|
      t.string :name
      t.date :effective_date
      t.date :end_date
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
