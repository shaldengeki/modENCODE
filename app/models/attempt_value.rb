class AttemptValue < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :attempt_attribute
  after_initialize {|value| value.build_attempt_attribute if attempt_attribute.nil? }
  accepts_nested_attributes_for :attempt_attribute, :reject_if => lambda { |a| ( a[:name].blank? ) }, :allow_destroy => true
  attr_accessible :value, :attempt_attribute_id, :created_at, :update_at, :attempt_attribute_attributes

  validates :value, :presence => true,
                    :length => {:minimum => 1}
  validates :attempt_attribute_id, :presence => true
  validates_uniqueness_of :attempt_attribute_id, :scope => :attempt_id
  validates :attempt_id, :presence => true

  def name
    attempt_attribute.name unless attempt_attribute.nil?
    nil
  end
end
