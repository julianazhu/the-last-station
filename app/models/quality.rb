class Quality < ActiveRecord::Base
  has_many :requirements, :dependent => :destroy
  has_many :stats, :dependent => :destroy
  delegate :name, to: :requirements, prefix: true #Not entirely sure this is necessary. Maybe delete.
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
