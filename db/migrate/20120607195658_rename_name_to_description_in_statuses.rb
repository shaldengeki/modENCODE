class RenameNameToDescriptionInStatuses < ActiveRecord::Migration
  def change
    change_table :statuses do |t|
      t.rename :name, :description
    end
  end
end
