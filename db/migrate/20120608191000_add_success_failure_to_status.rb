class AddSuccessFailureToStatus < ActiveRecord::Migration
  def change
    change_table :statuses do |t|
      t.boolean :success
      t.boolean :failure
    end
  end
end
