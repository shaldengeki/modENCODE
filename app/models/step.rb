class Step < ActiveRecord::Base
  belongs_to :pipeline
  has_many :statuses
  attr_accessible :description, :name, :start, :end, :position, :pipeline_id
  validates :name, :presence => true
  validates :start, :presence => true,
            :inclusion => {:in => [true, false]}
  validates :end, :presence => true,
            :inclusion => {:in => [true, false]}
  validates_numericality_of :position, :only_integer => true,
                                        :greater_than => 0
end
