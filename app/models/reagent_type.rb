class ReagentType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :reagent
  validates :name, :uniqueness=> { :case_sensitive => false},
                    :presence => true
end
