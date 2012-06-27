class Attempt < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :reagent
  belongs_to :pipeline

  has_many :statuses, :dependent => :destroy
  has_many :steps, :through => :pipeline
  accepts_nested_attributes_for :statuses, :reject_if => lambda { |a| a[:step_id].blank? }, :allow_destroy => true

  attr_accessible :reagent_id, :pipeline_id, :statuses, :created_at, :started_at, :statuses_attributes

  validates :reagent, :presence => true
  validates :pipeline, :presence => true

  def last_step
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first.step_id
    end
  end
  def last_position
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first.position
    end
  end
  def last_status
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first
    end
  end
  def next_position
    last_position + 1
  end
end
