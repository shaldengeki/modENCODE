class TranscriptionFactor < ActiveRecord::Base
  belongs_to :gene_type, :inverse_of => :transcription_factors
  has_many :isoforms, :dependent => :destroy, :inverse_of => :transcription_factor
  has_many :aliases, :dependent => :destroy, :inverse_of => :transcription_factor
  attr_accessible :cg_id, :flybase_id, :name, :refseq_id
  validates :name, :uniqueness => { :case_sensitive => true },
                    :presence => true
  validates :cg_id, :uniqueness => { :case_sensitive => false },
                    :allow_blank => true
  validates :flybase_id, :uniqueness => { :case_sensitive => false },
                    :allow_blank => true
  validates :refseq_id, :uniqueness => { :case_sensitive => false },
                    :allow_blank => true
end
