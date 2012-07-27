class AddReagentGroupUserJoinTable < ActiveRecord::Migration
  def change
    create_table :reagent_groups_users, :id => false do |t|
      t.references :reagent_group, :null => false
      t.references :user, :null => false
    end
    add_index(:reagent_groups_users, [:reagent_group_id, :user_id], :unique => true)
    add_index :reagent_groups_users, :user_id
  end
end
