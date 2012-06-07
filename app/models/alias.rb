class Alias < ActiveRecord::Base
  belongs_to :transcription_factor
  attr_accessible :name
end
