class Story < ActiveRecord::Base
  has_many :requirements, :dependent => :destroy
  has_many :branches, :dependent => :destroy
  accepts_nested_attributes_for :branches, 
                                :reject_if => lambda { |a| a[:description].blank? }
  accepts_nested_attributes_for :requirements, 
                                :reject_if => :all_blank, 
                                :allow_destroy => true
  validates :title, 
            length: { minimum: 3}
  validates :body, 
            allow_blank: true,
            length: { minimum: 5}
  validates :image_path, 
            allow_blank: true,
            length: { minimum: 3}
end
