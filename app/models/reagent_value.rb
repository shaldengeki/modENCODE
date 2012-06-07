class ReagentValue < ActiveRecord::Base
  belongs_to :reagent_attribute
  belongs_to :reagent
  attr_accessible :value
end
