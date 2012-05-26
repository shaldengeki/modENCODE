class Reagent < ActiveRecord::Base
  belongs_to :transcription_factor
  belongs_to :source
  belongs_to :reagent_type
  has_many :status
  has_many :status_update
  has_and_belongs_to_many :user
  attr_accessible :description, :name, :transcription_factor_id, :source_id, :reagent_type_id

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}
                  
end
