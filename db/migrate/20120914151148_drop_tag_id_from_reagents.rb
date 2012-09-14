class DropTagIdFromReagents < ActiveRecord::Migration
  def change
    remove_column :reagents, :tag_id
  end
end
