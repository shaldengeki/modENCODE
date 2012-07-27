class ReagentGroup < ActiveRecord::Base
  has_and_belongs_to_many :reagents
  # TODO: Make this a has_many :through in order to add a "display on homepage" field in the join table.
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :reagents
  attr_accessible :name, :reagents, :reagents_attributes, :reagent_ids, :users, :user_ids, :users_attributes

  validates :name, :presence => true,
                    :allow_blank => false,
                    :uniqueness => {:case_sensitive => false}
end