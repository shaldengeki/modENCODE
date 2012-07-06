class CreateAttemptAttributes < ActiveRecord::Migration
  def change
    create_table :attempt_attributes do |t|
      t.string :name
      t.references :reagent

      t.timestamps
    end
    add_index :attempt_attributes, :reagent_id
  end
end
