class Status < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :user
  belongs_to :step
  attr_accessible :start, :end, :description, :position, :attempt_id, :user_id, :step_id, :created_at, :updated_at, :success, :failure

  validates :description, :presence => true
  validates :start, :inclusion => {:in => [true, false]}
  validates :end, :inclusion => {:in => [true, false]}
  validates :success, :inclusion => {:in => [true, false]}
  validates :failure, :inclusion => {:in => [true, false]}

  validates :position, :presence => true, :uniqueness => {:scope => :attempt_id}
  validates_numericality_of :position, :only_integer => true,
                                        :greater_than => 0
  validates :user, :presence => true
  validates :step, :presence => true

  # gets the last-available position for the current status.
  def last_position
    if Status.where(:attempt_id => attempt_id).empty?
      0
    else
      Status.where(:attempt_id => attempt_id).order("position DESC").first.position
    end
  end
  # gets the next-available position for a certain attempt.
  def next_position
    last_position + 1
  end
end
