class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :pipeline
      t.references :status
      t.references :reagent

      t.timestamps
    end
    add_index :attempts, :pipeline_id
    add_index :attempts, :status_id
    add_index :attempts, :reagent_id
  end
end
