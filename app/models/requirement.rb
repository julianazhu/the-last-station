class Requirement < ActiveRecord::Base
  belongs_to :story
  belongs_to :quality
  validates :story_id,
          presence: true
  validates :quality_id, 
          presence: true
  validates :operation, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}

  def self.loop_through_story_requirements(story, character)
    story.requirements.each do |requirement| 
      corresponding_character_stat = character.stats.find_by(quality_id: requirement.quality.id) 
      @requirement_eligibility = requirement_eligibility_calculator(requirement, corresponding_character_stat)
      @story_eligibility = @story_eligibility && @requirement_eligibility
      Story.add_story_to_eligible_stories_array(story) unless @story_eligibility == false
    end
  end
  
  def self.requirement_eligibility_calculator(requirement, stat)
    if requirement.operation == "greater than"
      stat.points > requirement.amount
    elsif requirement.operation == "less than"
      stat.points < requirement.amount
    elsif requirment.operation == "equals"
      stat.points == requirement.amount
    else
      raise "Error: Operation is not an accepted type. ABORT. FATAL. Ring the catastrophe bell."
    end
  end
end
