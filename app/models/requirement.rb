class Requirement < ActiveRecord::Base
  belongs_to :story
  has_one :quality
  validates :quality, 
          presence: true
  validates :modifier, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}
end
