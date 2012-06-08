class TranscriptionFactor < ActiveRecord::Base
  attr_accessible :cg_id, :flybase_id, :name, :refseq_id
  has_many :isoforms, :dependent => :destroy
  has_many :aliases, :dependent => :destroy
  validates :name, :uniqueness => { :case_sensitive => true },
                    :presence => true
  validates :cg_id, :uniqueness => { :case_sensitive => false },
                    :allow_blank => true
  validates :flybase_id, :uniqueness => { :case_sensitive => false },
                    :allow_blank => true
  validates :refseq_id, :uniqueness => { :case_sensitive => false },
                    :allow_blank => true
end
