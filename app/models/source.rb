class Source < ActiveRecord::Base
  has_many :reagents
  has_many :users
  has_many :pipelines
  attr_accessible :description, :name
  validates :name, :uniqueness => { :case_sensitive => false },
                    :presence => true
end
