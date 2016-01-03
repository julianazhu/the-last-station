class Story < ActiveRecord::Base
  has_many :branches, :dependent => :destroy
  has_many :requirements, :dependent => :destroy
  accepts_nested_attributes_for :branches, 
                                :reject_if => :all_blank,
                                :allow_destroy => true
  accepts_nested_attributes_for :requirements, 
                                :reject_if => :all_blank, 
                                :allow_destroy => true
  validates :title, 
            length: { minimum: 3}
  validates :hook, 
            allow_blank: true,
            length: { minimum: 5}
  validates :body, 
            allow_blank: true,
            length: { minimum: 5}
  validates :image_path, 
            allow_blank: true,
            length: { minimum: 3}
  validates :location, 
            length: { minimum: 3}

  def eligible?(character)
    Eligible.new(character, self).eligibility
  end

  def character_in_story_location?(character)
    character.location.description == self.location
  end
end
