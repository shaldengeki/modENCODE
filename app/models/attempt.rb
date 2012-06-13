class Attempt < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :reagent
  belongs_to :pipeline

  has_many :statuses, :order => "updated_at ASC", :dependent => :destroy
  accepts_nested_attributes_for :statuses, :reject_if => lambda { |a| a[:step_id].blank? }, :allow_destroy => true

  attr_accessible :reagent_id, :pipeline_id, :statuses, :created_at, :started_at, :statuses_attributes

  validates :reagent, :presence => true
  validates :pipeline, :presence => true

  def last_position
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first.position
    end
  end
  def next_position
    last_position + 1
  end
  def steps
    if pipeline.nil?
      nil
    else
      pipeline.steps
    end
  end
end
