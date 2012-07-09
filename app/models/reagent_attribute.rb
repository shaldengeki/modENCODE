class ReagentAttribute < ActiveRecord::Base
  belongs_to :reagent_type
  has_many :reagent_values, :dependent => :destroy
  attr_accessible :name, :reagent_type_id

  validates :name, :presence => true,
                    :length => {:minimum => 1}
  validates :reagent_type_id, :presence => true
end
