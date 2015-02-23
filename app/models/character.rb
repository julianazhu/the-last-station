class Character < ActiveRecord::Base
  has_many :stats
  validates :name, 
            presence: true, 
            length: { minimum: 3}
end
