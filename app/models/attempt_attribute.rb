class AttemptAttribute < ActiveRecord::Base
  has_many :attempt_values
  has_many :attempts, :through => :attempt_values
  attr_accessible :name

  validates :name, :presence => true,
                    :uniqueness => true
end