class CreateReagentGroups < ActiveRecord::Migration
  def change
    create_table :reagent_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
