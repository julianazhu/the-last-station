class Story < ActiveRecord::Base
  has_many :requirements
  validates :title, 
            presence: true, 
            length: { minimum: 3}
  validates :body, 
            presence: true, 
            length: { minimum: 5}
  validates :image_path, 
            allow_blank: true,
            length: { minimum: 3}
end
