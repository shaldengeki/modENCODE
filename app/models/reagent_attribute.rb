class ReagentAttribute < ActiveRecord::Base
  belongs_to :reagent_type, :inverse_of => :reagent_attributes
  has_many :reagent_values, :dependent => :destroy, :inverse_of => :reagent_attribute
  attr_accessible :name, :reagent_type_id

  validates :name, :presence => true,
                    :length => {:minimum => 1}
  validates :reagent_type_id, :presence => true
end
