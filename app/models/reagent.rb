class Reagent < ActiveRecord::Base
  has_and_belongs_to_many :isoform
  belongs_to :tag
  belongs_to :source
  belongs_to :reagent_type
  has_many :attempts
  attr_accessible :description, :name, :tag_id, :source_id, :reagent_type_id

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}
  validates :tag, :presence => true
end
