class CharacterStat < ActiveRecord::Base
  belongs_to :character
  belongs_to :quality
  attr_accessible :name :description, prefix: true
end
