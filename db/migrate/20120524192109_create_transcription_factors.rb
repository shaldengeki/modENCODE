class CreateTranscriptionFactors < ActiveRecord::Migration
  def change
    create_table :transcription_factors do |t|
      t.string :name
      t.string :flybase_id
      t.string :cg_id
      t.string :refseq_id

      t.timestamps
    end
  end
end
