class Pipeline < ActiveRecord::Base
  belongs_to :source, :inverse_of => :pipelines
  has_many :attempts, :inverse_of => :pipeline
  has_many :steps, :order => "position", :dependent => :destroy, :inverse_of => :pipeline
  accepts_nested_attributes_for :steps, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  attr_accessible :description, :name, :source_id, :reagent_type_id, :steps_attributes

  validates :name, :presence => true
  validates :source, :presence => true
end
