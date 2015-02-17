class Character < ActiveRecord::Base
  has_many :characterstats
  validates :name, 
            presence: true, 
            length: { minimum: 3}
end
