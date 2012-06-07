class CreateReagentValues < ActiveRecord::Migration
  def change
    create_table :reagent_values do |t|
      t.string :value
      t.references :reagent_attribute

      t.timestamps
    end
    add_index :reagent_values, :reagent_attribute_id
  end
end
