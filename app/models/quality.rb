class Quality < ActiveRecord::Base
  belongs_to :character
    validates :name, 
              presence: true, 
              length: { minimum: 3}
    validates :description, 
              presence: true, 
              length: { minimum: 5}
    validates :image_path, 
              length: { minimum: 3}
end
