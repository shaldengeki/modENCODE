class Alias < ActiveRecord::Base
  belongs_to :transcription_factor
  attr_accessible :name

  validates_uniqueness_of :name, :scope => :transcription_factor_id
  validates :name, :presence => true

  def transcription_factor_name
    if transcription_factor.nil?
      nil
    else
      transcription_factor.name
    end
  end
end
