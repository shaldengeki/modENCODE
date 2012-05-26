class Status < ActiveRecord::Base
  belongs_to :reagent
  has_many :status_update
  attr_accessible :end, :name, :position, :start, :reagent_id

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false}
  validates :start, :presence => true,
            :inclusion => {:in => [true, false]}
  validates :end, :presence => true,
            :inclusion => {:in => [true, false]}

  validates :position, :presence => true,
                        :numericality => {:only_integer => true,
                                          :greater_than => 0}
end
