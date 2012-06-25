class Reagent < ActiveRecord::Base
  has_and_belongs_to_many :isoforms
  belongs_to :tag
  belongs_to :source
  belongs_to :reagent_type
  has_many :attempts, :order => "updated_at DESC"
  has_many :reagent_values, :dependent => :destroy
  accepts_nested_attributes_for :reagent_values, :reject_if => lambda { |a| a[:reagent_attribute_id].blank? }, :allow_destroy => true
  attr_accessible :description, :name, :tag_id, :source_id, :reagent_type_id, :isoform_ids, :reagent_values_attributes

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}
  validates :tag, :presence => true
  validates :source, :presence => true
  validates :reagent_type, :presence => true
end
