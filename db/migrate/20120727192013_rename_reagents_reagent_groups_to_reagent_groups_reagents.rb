class RenameReagentsReagentGroupsToReagentGroupsReagents < ActiveRecord::Migration
  def change
    rename_table :reagent_reagent_groups, :reagent_groups_reagents
  end
end
