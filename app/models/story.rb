class Story < ActiveRecord::Base
  attr_reader :eligible_stories
  has_many :branches, :dependent => :destroy
  has_many :requirements, :dependent => :destroy
  has_many :fate_cards, :dependent => :destroy
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

  def eligible_stories(character, set_of_stories)
    stories = []
    set_of_stories.each do |story|  
      if story.eligible?(character) && (story.character_in_story_location?(character) || story.location == "Fate Card")
        stories.push(story)
      end
    end
    stories
  end

  def character_in_story_location?(character)
    character.location.description == self.location
  end
end
