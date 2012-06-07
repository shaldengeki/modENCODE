class DropStartEndFromSteps < ActiveRecord::Migration
  def change
    remove_column :steps, :start
    remove_column :steps, :end
  end
end
