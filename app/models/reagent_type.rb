class ReagentType < ActiveRecord::Base
  has_many :reagents, :dependent => :destroy, :inverse_of => :reagent_type
  has_many :reagent_attributes, :inverse_of => :reagent_type
  attr_accessible :description, :name
  validates :name, :uniqueness=> { :case_sensitive => false},
                    :presence => true
end
