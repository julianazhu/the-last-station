class Character < ActiveRecord::Base
  has_many :qualities, through: :characterStats
  validates :character_name, 
            presence: true, 
            length: { minimum: 3}
end
