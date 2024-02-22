class CreateNoteEvaluateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :note_evaluate_branches do |t|
      t.integer :dateEval
      t.references :note, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
