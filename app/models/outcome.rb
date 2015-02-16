class Outcome < ActiveRecord::Base
  belongs_to :story
  has_many :effects
  validates :story_id, 
            presence: true
  validates :title,
            presence: true,
            length: { minimum: 5}
  validates :body, 
            presence: true,
            length: { minimum: 5}
end
