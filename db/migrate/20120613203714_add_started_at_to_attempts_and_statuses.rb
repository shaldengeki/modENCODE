class AddStartedAtToAttemptsAndStatuses < ActiveRecord::Migration
  def change
    change_table :attempts do |t|
      t.datetime :started_at
    end
    add_index :attempts, :started_at
    change_table :statuses do |t|
      t.datetime :started_at
    end
    add_index :statuses, :started_at
  end
end
