class CreatePipelines < ActiveRecord::Migration
  def change
    create_table :pipelines do |t|
      t.string :name
      t.string :description
      t.references :source
      t.references :reagent_type

      t.timestamps
    end
    add_index :pipelines, :source_id
    add_index :pipelines, :reagent_type_id
  end
end
