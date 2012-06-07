class IndexStepsOnName < ActiveRecord::Migration
  def change
    add_index :steps, :name
  end
end
