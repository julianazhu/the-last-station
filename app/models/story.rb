class Story < ActiveRecord::Base
  has_many :requirements
  has_many :branches
  validates :title, 
            presence: true, 
            length: { minimum: 3}
  validates :body, 
            presence: true, 
            length: { minimum: 5}
  validates :image_path, 
            allow_blank: true,
            length: { minimum: 3}
         
  def self.find_eligible_stories(character)
    create_eligible_stories_array
    loop_through_all_stories(character)
  end 
  
  def self.create_eligible_stories_array
    @eligible_stories = []
  end
  
  def self.add_story_to_eligible_stories_array(story)
    @eligible_stories = @eligible_stories.push(story)
  end
  
  def self.loop_through_all_stories(character)
    Story.all.each do |story|
      @story_eligibility = true
      if story.requirements.first.nil? 
        @eligible_stories.push(story)
      else
        Requirement.loop_through_story_requirements(story, character)
      end
    end
  end
end
