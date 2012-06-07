class Tag < ActiveRecord::Base
  has_many :reagents
  attr_accessible :description, :name

  validates :name, :presence => true
end
