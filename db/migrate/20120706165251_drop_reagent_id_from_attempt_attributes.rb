class DropReagentIdFromAttemptAttributes < ActiveRecord::Migration
  def change
    remove_index :attempt_attributes, :reagent_id
    remove_column :attempt_attributes, :reagent_id
  end
end
