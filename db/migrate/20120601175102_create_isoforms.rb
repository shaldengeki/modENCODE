class CreateIsoforms < ActiveRecord::Migration
  def change
    create_table :isoforms do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
