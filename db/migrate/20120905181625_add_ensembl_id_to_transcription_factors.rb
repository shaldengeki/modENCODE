class AddEnsemblIdToTranscriptionFactors < ActiveRecord::Migration
  def change
    change_table :transcription_factors do |t|
      t.string :ensembl_id
    end
    add_index :transcription_factors, :ensembl_id
  end
end
