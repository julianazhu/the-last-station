class Character < ActiveRecord::Base
  has_many :qualities
  validates :characterName, presence: true, length: { minimum: 3}
end
