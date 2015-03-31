class Requirement < ActiveRecord::Base
  belongs_to :story
  belongs_to :quality
  validates :quality_id, 
          presence: true,
          uniqueness: { scope: :story_id, message: "can't be the same as another requirement."}
  validates :operation, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}
end
