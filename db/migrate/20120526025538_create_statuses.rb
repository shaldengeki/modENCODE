class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.references :reagent
      t.boolean :start
      t.boolean :end
      t.integer :position

      t.timestamps
    end
    add_index :statuses, :reagent_id
  end
end
