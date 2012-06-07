class Status < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :user
  belongs_to :step
  attr_accessible :start, :end, :description, :position, :attempt_id, :user_id, :step_id, :created_at, :updated_at

  validates :description, :presence => true
  validates :start, :inclusion => {:in => [true, false]}
  validates :end, :inclusion => {:in => [true, false]}

  validates :position, :presence => true
  validates_numericality_of :position, :only_integer => true,
                                        :greater_than => 0
  validates :user, :presence => true
  validates :step, :presence => true
end
