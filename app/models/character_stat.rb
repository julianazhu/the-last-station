class CharacterStat < ActiveRecord::Base
  belongs_to :character
  has_many :qualities
  attr_accessible :name :description, prefix: true
end
