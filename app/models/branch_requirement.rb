class BranchRequirement < ActiveRecord::Base
  belongs_to :branch
  belongs_to :quality
  validates :quality_id, 
          presence: true,
          uniqueness: { scope: :branch_id, message: "can't be the same as another requirement."}
  validates :operation, 
          presence: true
  validates :points, 
          presence: true,
          numericality: {only_integer: true}

  def get_level
    Level.get_level_description(self.quality, self.points)
  end
end
