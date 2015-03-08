class Story < ActiveRecord::Base
  has_many :requirements, :dependent => :destroy
  has_many :branches, :dependent => :destroy
  validates :title, 
            allow_blank: true,
            length: { minimum: 3}
  validates :body, 
            allow_blank: true,
            length: { minimum: 5}
  validates :image_path, 
            allow_blank: true,
            length: { minimum: 3}
end
