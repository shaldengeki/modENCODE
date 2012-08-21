class GeneType < ActiveRecord::Base
  has_many :transcription_factors, :inverse_of => :gene_type
  attr_accessible :name

  validates :name, :presence => true,
                  :allow_blank => false,
                  :uniqueness => {:case_sensitive => false}
end