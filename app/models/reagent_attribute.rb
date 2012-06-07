class ReagentAttribute < ActiveRecord::Base
  belongs_to :reagent_type
  has_many :reagent_values
  attr_accessible :name
end
