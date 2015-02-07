class Character < ActiveRecord::Base
  has_many :qualities
  validates :character_name, 
            presence: true, 
            length: { minimum: 3}
end
