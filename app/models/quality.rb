class Quality < ActiveRecord::Base
  has_many :requirements
  delegate :name, :description, :image_path, to: :characterstats, prefix: true
  delegate :name, to: :requirements, prefix: true
  validates :name, 
            presence: true, 
            length: { minimum: 3}
  validates :description, 
            presence: true, 
            length: { minimum: 5}
  validates :image_path, 
            allow_blank: true,
            length: { minimum: 3}
end
