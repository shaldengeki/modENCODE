class AddReagentReagentGroupJoinTable < ActiveRecord::Migration
  def change
    create_table :reagent_reagent_groups, :id => false do |t|
      t.references :reagent, :null => false
      t.references :reagent_group, :null => false
    end
    add_index(:reagent_reagent_groups, [:reagent_id, :reagent_group_id], :unique => true)
    add_index :reagent_reagent_groups, :reagent_group_id
  end
end
