class AddReagentAttributeAndValueCompoundIndexToReagentValues < ActiveRecord::Migration
  def change
    remove_index :reagent_values, :reagent_attribute_id
    add_index :reagent_values, [:reagent_attribute_id, :value]
  end
end
