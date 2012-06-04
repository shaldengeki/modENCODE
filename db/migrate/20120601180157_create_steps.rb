class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.string :description
      t.references :pipeline

      t.timestamps
    end
    add_index :steps, :pipeline_id
  end
end
