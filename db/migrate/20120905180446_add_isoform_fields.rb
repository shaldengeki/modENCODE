class AddIsoformFields < ActiveRecord::Migration
  def change
    change_table :isoforms do |t|
      t.string :ensembl_id
      t.boolean :strand
      t.string :type
      t.integer :last_exon_start
      t.integer :last_exon_end
      t.integer :stop_codon_start
      t.integer :stop_codon_end
      t.float :frac_r1
      t.integer :fpkm_r1
      t.float :frac_r2
      t.integer :fpkm_r2
      t.integer :flag
    end
    add_index :isoforms, :ensembl_id
    add_index :isoforms, :strand
    add_index :isoforms, :type
    add_index :isoforms, :last_exon_start
    add_index :isoforms, :stop_codon_start
    add_index :isoforms, :frac_r1
    add_index :isoforms, :fpkm_r1
    add_index :isoforms, :frac_r2
    add_index :isoforms, :fpkm_r2
  end
end
