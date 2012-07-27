class Isoform < ActiveRecord::Base
  has_and_belongs_to_many :reagents
  belongs_to :transcription_factor, :inverse_of => :isoforms
  attr_accessible :description, :name, :transcription_factor_id, :reagent_ids

  validates :transcription_factor, :presence => true
  # validates :reagents, :presence => true, :allow_blank => true, :allow_nil => true
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
end
