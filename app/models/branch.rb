class Branch < ActiveRecord::Base

  has_many :effects
  belongs_to :story
  validates :story_id, 
            presence: true
  validates :title,
            presence: true,
            length: { minimum: 5}
  validates :description, 
            presence: true,
            length: { minimum: 5}
  validates :outcome, 
            presence: true,
            length: { minimum: 5}
end
