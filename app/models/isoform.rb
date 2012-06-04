class Isoform < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :reagents
  belongs_to :transcription_factor

  attr_accessible :transcription_factor_id
end
