class Source < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :reagent
  has_many :user
  validates :name, :uniqueness => { :case_sensitive => false },
                    :presence => true
end