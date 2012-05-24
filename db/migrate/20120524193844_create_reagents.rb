class CreateReagents < ActiveRecord::Migration
  def change
    create_table :reagents do |t|
      t.string :name
      t.string :description
      t.references :transcription_factor
      t.references :source
      t.references :reagent_type

      t.timestamps
    end
    add_index :reagents, :transcription_factor_id
    add_index :reagents, :source_id
    add_index :reagents, :reagent_type_id
  end
end
