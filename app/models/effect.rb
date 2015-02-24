class Effect < ActiveRecord::Base
  belongs_to :branch
  belongs_to :quality
  validates :branch_id,
          presence: true
  validates :quality_id, 
          presence: true
  validates :operation, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}
end
