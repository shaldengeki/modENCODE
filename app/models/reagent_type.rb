class ReagentType < ActiveRecord::Base
  has_many :reagents, :dependent => :destroy
  has_many :pipelines
  attr_accessible :description, :name
  validates :name, :uniqueness=> { :case_sensitive => false},
                    :presence => true
end
