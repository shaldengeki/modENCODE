class AddEntrezHgncidLocationToGenes < ActiveRecord::Migration
  def change
    change_table :transcription_factors do |t|
      t.integer :entrez_id
      t.integer :hgnc_id
    end
    add_index :transcription_factors, :entrez_id
    add_index :transcription_factors, :hgnc_id
  end
end
