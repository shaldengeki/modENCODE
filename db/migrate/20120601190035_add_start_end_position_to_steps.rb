class AddStartEndPositionToSteps < ActiveRecord::Migration
  def change
    change_table :steps do |t|
      t.boolean :start
      t.boolean :end
      t.integer :position
    end
  end
end
