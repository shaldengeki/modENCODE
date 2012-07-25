class ReagentValue < ActiveRecord::Base
  belongs_to :reagent_attribute
  belongs_to :reagent
  accepts_nested_attributes_for :reagent_attribute, :reject_if => lambda { |a| (a[:name].blank?) }, :allow_destroy => true
  attr_accessible :value, :reagent_attribute_id, :created_at, :update_at

  validates :value, :presence => true,
                    :length => {:minimum => 1}
  validates :reagent_attribute_id, :presence => true
  # validates :reagent_id, :presence => true
end
