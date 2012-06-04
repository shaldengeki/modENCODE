class Attempt < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :reagent
  belongs_to :pipeline
  has_many :statuses
  attr_accessible :reagent_id, :pipeline_id, :statuses
end
