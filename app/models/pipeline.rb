class Pipeline < ActiveRecord::Base
  belongs_to :source
  has_many :attempts

  has_many :steps, :order => "position", :dependent => :destroy
  accepts_nested_attributes_for :steps, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  attr_accessible :description, :name, :source_id, :reagent_type_id, :steps_attributes

  validates :name, :presence => true
  validates :source, :presence => true
end
