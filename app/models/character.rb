class Character < ActiveRecord::Base
  has_many :stats, :dependent => :destroy
  validates :name, 
            presence: true, 
            length: { minimum: 3}

  def find_eligible_stories
    @eligible_stories = []
    loop_through_all_stories
    @eligible_stories
  end 
  
  def loop_through_all_stories
    Story.all.each do |story|
      @story_eligibility = true
      if story.requirements.first.nil? 
        @eligible_stories.push(story)
      else
        loop_through_story_requirements(story)
      end
    end
  end
  
  def loop_through_story_requirements(story)
    story.requirements.each do |requirement| 
      @character_stat_points = get_corresponding_character_stat(requirement)
      @requirement_eligibility = requirement_eligibility_calculator(requirement, @character_stat_points)
      @story_eligibility = @story_eligibility && @requirement_eligibility
      @eligible_stories.push(story) unless @story_eligibility == false
    end
  end

  def get_corresponding_character_stat(requirement)
  	character_stat = self.stats.find_by(quality_id: requirement.quality.id)
  	if character_stat == nil
  		character_stat_points = 0
  	else
  		character_stat_points = character_stat.points
  	end
  end
  
  def requirement_eligibility_calculator(requirement, character_stat_points)
    if requirement.operation == "greater than"
      character_stat_points > requirement.amount
    elsif requirement.operation == "less than"
      character_stat_points < requirement.amount
    elsif requirment.operation == "equals"
      character_stat_points == requirement.amount
    else
      raise "Error: Operation is not an accepted type. ABORT. FATAL. Ring the catastrophe bell."
    end
  end

end
