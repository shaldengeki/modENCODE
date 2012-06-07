class AddReagentIdToReagentValue < ActiveRecord::Migration
  def change
    change_table :reagent_values do |t|
      t.integer :reagent_id
    end
  end
end
