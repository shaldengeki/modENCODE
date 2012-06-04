class Pipeline < ActiveRecord::Base
  belongs_to :source
  has_many :attempts
  has_many :steps
  belongs_to :reagent_type
  attr_accessible :description, :name, :source_id, :reagent_type_id
end
