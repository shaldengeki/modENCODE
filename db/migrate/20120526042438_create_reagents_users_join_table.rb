class CreateReagentsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :reagents_users, :id => false do |t|
      t.references :reagent, :null => false
      t.references :user, :null => false
    end
    add_index(:reagents_users, :reagent_id, :unique => true)
    add_index(:reagents_users, :user_id, :unique => true)
  end
end
