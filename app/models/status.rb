class Status < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :user
  belongs_to :step
  attr_accessible :start, :end, :description, :attempt_id, :user_id, :step_id

  validates :description, :presence => true
  validates :start, :presence => true,
            :inclusion => {:in => [true, false]}
  validates :end, :presence => true,
            :inclusion => {:in => [true, false]}

  validates :position, :presence => true,
                        :numericality => {:only_integer => true,
                                          :greater_than => 0}
end
