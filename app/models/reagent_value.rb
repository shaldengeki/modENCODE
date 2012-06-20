class ReagentValue < ActiveRecord::Base
  belongs_to :reagent_attribute
  belongs_to :reagent
  attr_accessible :value, :reagent_attribute_id, :created_at, :update_at
end
