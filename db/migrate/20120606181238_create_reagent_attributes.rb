class CreateReagentAttributes < ActiveRecord::Migration
  def change
    create_table :reagent_attributes do |t|
      t.string :name
      t.references :reagent_type

      t.timestamps
    end
    add_index :reagent_attributes, :reagent_type_id
  end
end
