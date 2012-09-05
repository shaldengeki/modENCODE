class AddDescriptionToTranscriptionFactors < ActiveRecord::Migration
  def change
    add_column :transcription_factors, :description, :string
  end
end
