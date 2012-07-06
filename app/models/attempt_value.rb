class AttemptValue < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :attempt_attribute
  accepts_nested_attributes_for :attempt_attribute, :reject_if => lambda { |a| ( a[:name].blank? ) }, :allow_destroy => true
  attr_accessible :value, :attempt_attribute_id, :created_at, :update_at

  validates :value, :presence => true
  validates :attempt_attribute_id, :presence => true
  validates :attempt_id, :presence => true

  def name
    attempt_attribute.name unless attempt_attribute.nil?
    nil
  end
end
