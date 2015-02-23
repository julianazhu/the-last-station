class Stat < ActiveRecord::Base
  belongs_to :character
  belongs_to :quality
  validates :character_id,
          presence: true,
          numericality: {only_integer: true}          
  validates :quality_id,
          presence: true,
          numericality: {only_integer: true}
  validates :points, 
          presence: true,
          numericality: {only_integer: true}
end
