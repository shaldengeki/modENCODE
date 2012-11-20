class Step < ActiveRecord::Base
  belongs_to :pipeline, :inverse_of => :steps
  has_many :statuses, :inverse_of => :step
  acts_as_list :scope => :pipeline
  attr_accessible :description, :name, :position, :pipeline_id

  validates :name, :presence => true
  validates_numericality_of :position, :only_integer => true,
                                        :greater_than => 0
  validates :description, :length => {:in => 0..1000}, :allow_blank => true
  # validates :position, :uniqueness => {:scope => :pipeline_id}
end
