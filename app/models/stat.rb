class Stat < ActiveRecord::Base
  belongs_to :character
  belongs_to :quality
  delegate :name, to: :quality 
  validates :character_id,
            presence: true,
            numericality: {only_integer: true}          
  validates :quality_id,
            presence: true,
            numericality: {only_integer: true}
  validates :points,
            presence: true,
            format: { with: /[0-9a-zA-Z]*/ }

  def get_description
    description = Level.get_level_description(self.quality, self.points)
    if self.get_level.blank?
      return "You are #{self.name}."
    else
      return "Your #{self.name} is " + "#{description}"
    end
  end

  def get_level
    Level.get_level(self.quality, self.points)
  end

end
