class StatusUpdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :reagent
  attr_accessible :description, :time, :status_id, :reagent_id
end
