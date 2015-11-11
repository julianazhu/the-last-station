class Stat < ActiveRecord::Base
  belongs_to :character
  belongs_to :quality
  validates :character_id,
            presence: true,
            numericality: {only_integer: true}          
  validates :quality_id,
            presence: true,
            numericality: {only_integer: true}
  # This should be an integer if the stat is point based, but can be a description i.e. location name. 
  validates :points,
            presence: true,
            format: { with: /[0-9a-zA-Z]*/ }

  def get_level
    Level.where(quality_id: self.quality_id).find_by("minimum_points >= ?", self.points)
  end

end
