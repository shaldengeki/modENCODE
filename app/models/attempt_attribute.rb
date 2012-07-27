class AttemptAttribute < ActiveRecord::Base
  has_many :attempt_values, :inverse_of => :attempt_attribute
  has_many :attempts, :through => :attempt_values
  attr_accessible :name

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :length => {:minimum => 1}
end