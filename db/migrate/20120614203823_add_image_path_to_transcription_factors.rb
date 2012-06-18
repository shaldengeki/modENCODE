class AddImagePathToTranscriptionFactors < ActiveRecord::Migration
  def change
    change_table :transcription_factors do |t|
      t.string :isoform_image_path
    end
  end
end
