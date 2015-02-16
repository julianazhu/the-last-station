class Effect < ActiveRecord::Base
  belongs_to :outcome
  belongs_to :quality
  validates :outcome_id,
          presence: true
  validates :quality_id, 
          presence: true
  validates :modifier, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}
end
