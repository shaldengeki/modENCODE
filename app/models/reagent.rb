class Reagent < ActiveRecord::Base
  belongs_to :transcription_factor
  belongs_to :source
  belongs_to :reagent_type
  attr_accessible :description, :name, :transcription_factor_id, :source_id, :reagent_type_id
end
