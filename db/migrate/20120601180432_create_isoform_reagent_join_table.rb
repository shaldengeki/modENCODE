class CreateIsoformReagentJoinTable < ActiveRecord::Migration
  def change
    create_table :isoforms_reagents, :id => false do |t|
      t.references :isoform, :null => false
      t.references :reagent, :null => false
    end
    add_index(:isoforms_reagents, [:isoform_id, :reagent_id], :unique => true)
    add_index :isoforms_reagents, :reagent_id
  end
end
