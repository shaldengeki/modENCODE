class Attempt < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :reagent
  belongs_to :pipeline

  has_many :statuses, :order => "updated_at ASC"
  accepts_nested_attributes_for :statuses, :reject_if => lambda { |a| a[:step_id].blank? }, :allow_destroy => true

  attr_accessible :reagent_id, :pipeline_id, :statuses, :created_at, :updated_at, :statuses_attributes

  validates :reagent, :presence => true
  validates :pipeline, :presence => true
end
