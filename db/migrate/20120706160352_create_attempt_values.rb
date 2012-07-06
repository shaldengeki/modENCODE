class CreateAttemptValues < ActiveRecord::Migration
  def change
    create_table :attempt_values do |t|
      t.string :value
      t.references :attempt
      t.references :attempt_attribute

      t.timestamps
    end
    add_index :attempt_values, :attempt_id
    add_index :attempt_values, :attempt_attribute_id
  end
end
