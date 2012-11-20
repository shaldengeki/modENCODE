class Status < ActiveRecord::Base
  belongs_to :attempt, :inverse_of => :statuses
  belongs_to :user, :inverse_of => :statuses
  belongs_to :step, :inverse_of => :statuses
  has_one :reagent, :through => :attempt
  accepts_nested_attributes_for :attempt, :reject_if => lambda { |a| a[:user_ids].empty? }
  attr_accessible :start, :end, :position, :description, :attempt_id, :user_id, :step_id, :started_at, :success, :failure, :attempt_attributes, :reagent_id

  validates :description, :length => {:in => 0..1000}, :allow_blank => true
  validates :start, :inclusion => {:in => [true, false]}
  validates :end, :inclusion => {:in => [true, false]}
  validates :success, :inclusion => {:in => [true, false]}
  validates :failure, :inclusion => {:in => [true, false]}

  validates :position, :presence => true# , :uniqueness => {:scope => :attempt_id}
  validates_numericality_of :position, :only_integer => true,
                                        :greater_than => 0
  validates :user, :presence => true
  validates :step, :presence => true
  # validates :started_at, :presence => true
  # validate :started_at_is_valid_datetime

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

  def outcome_text
    success ? "success" : (failure ? "failed" : "in-progress")
  end
  # def started_at_is_valid_datetime
  #   errors.add(:started_at, 'must be a valid datetime') if ((DateTime.parse(started_at) rescue ArgumentError) == ArgumentError)
  # end
end
