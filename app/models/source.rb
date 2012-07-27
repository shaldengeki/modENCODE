class Source < ActiveRecord::Base
  has_many :reagents, :inverse_of => :source
  has_many :users, :inverse_of => :source
  has_many :pipelines, :inverse_of => :source
  attr_accessible :description, :name
  validates :name, :uniqueness => { :case_sensitive => false },
                    :presence => true
end
