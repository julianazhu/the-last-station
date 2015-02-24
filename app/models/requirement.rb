class Requirement < ActiveRecord::Base
  belongs_to :story
  belongs_to :quality
  validates :story_id,
          presence: true
  validates :quality_id, 
          presence: true
  validates :operation, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}
end
