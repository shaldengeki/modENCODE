class DropStatusFromAttempt < ActiveRecord::Migration
  def change
    remove_index :attempts, :status_id
    remove_column :attempts, :status_id
  end
end
