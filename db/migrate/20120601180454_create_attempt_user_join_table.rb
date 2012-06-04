class CreateAttemptUserJoinTable < ActiveRecord::Migration
  def change
    create_table :attempts_users, :id => false do |t|
      t.references :attempt, :null => false
      t.references :user, :null => false
    end
    add_index(:attempts_users, [:attempt_id, :user_id], :unique => true)
    add_index :attempts_users, :user_id
  end
end
