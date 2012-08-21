class AddGeneTypeIdToTranscriptionFactors < ActiveRecord::Migration
  def change
    change_table :transcription_factors do |t|
      t.references :gene_type
    end
    add_index :transcription_factors, :gene_type_id
  end
end
