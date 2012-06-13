class Reagent < ActiveRecord::Base
  has_and_belongs_to_many :isoforms
  belongs_to :tag
  belongs_to :source
  belongs_to :reagent_type
  has_many :attempts
  has_many :reagent_values, :dependent => :destroy
  attr_accessible :description, :name, :tag_id, :source_id, :reagent_type_id, :isoform_ids

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}
  validates :tag, :presence => true
  validates :source, :presence => true
  validates :reagent_type, :presence => true
end
