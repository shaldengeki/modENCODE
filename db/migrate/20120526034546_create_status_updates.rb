class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.references :user
      t.references :status
      t.references :reagent
      t.datetime :time
      t.string :description

      t.timestamps
    end
    add_index :status_updates, :user_id
    add_index :status_updates, :status_id
    add_index :status_updates, :reagent_id
  end
end
