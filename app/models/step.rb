class Step < ActiveRecord::Base
  belongs_to :pipeline
  has_many :statuses

  acts_as_list :scope => :pipeline

  attr_accessible :description, :name, :position, :pipeline_id

  validates :name, :presence => true
  validates_numericality_of :position, :only_integer => true,
                                        :greater_than => 0
  validates :position, :uniqueness => {:scope => :pipeline_id}
end
