class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role
      t.references :source

      t.timestamps
    end
    add_index :users, :source_id
  end
end
