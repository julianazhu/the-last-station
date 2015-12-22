class Requirement < ActiveRecord::Base
  belongs_to :story
  belongs_to :quality
  delegate :id, to: :quality, prefix: true, allow_nil: true
  validates :quality_id, 
          presence: true,
          uniqueness: { scope: :story_id, message: "can't be the same as another requirement."}
  validates :operation, 
          presence: true
  validates :points, 
          presence: true,
          numericality: {only_integer: true}

  def get_level
    Level.get_level_description(self.quality, self.points)
  end
end
