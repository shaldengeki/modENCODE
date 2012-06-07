class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :name
      t.references :transcription_factor

      t.timestamps
    end
    add_index :aliases, :transcription_factor_id
  end
end
