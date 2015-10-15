class Character < ActiveRecord::Base
attr_writer :current_step
  has_many :stats, :dependent => :destroy
  validates :name, 
            length: { minimum: 3 },
            presence: true,
            format: { with: /\A[a-zA-Z\d ]*\Z/, :message => "can only use letters, numbers, spaces." },
            :if => lambda { |f| f.current_step == "name" }
  validates :avatar_image_path,
            length: { minimum: 5 },
            presence: true,
            :if => lambda { |f| f.current_step == "avatar"}
  validates_presence_of :gender, :if => lambda { |f| f.current_step == "gender"}

# Intro Form
def current_step
  @current_step || steps.first
end

def steps
  %w[intro name gender avatar]
end

def next_step
  self.current_step = steps[steps.index(current_step)+1]
end

def previous_step
  self.current_step = steps[steps.index(current_step)-1]
end

def first_step?
  current_step == steps.first
end

def last_step?
  current_step == steps.last
end

def all_valid?
  steps.all? do |step|
    self.current_step = step
    valid?
  end
end

# Gameplay
  def find_eligible_stories
    @eligible_stories = []
    loop_through_all_stories
    @eligible_stories
  end 
  
  def loop_through_all_stories
    Story.all.each do |story|
      @story_eligibility = true
      if story.requirements.empty? 
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
    end
    @eligible_stories.push(story) if @story_eligibility == true
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
    elsif requirement.operation == "equals"
      character_stat_points == requirement.amount
    else
      raise "Error: Operation is not an accepted type. ABORT. FATAL. Ring the catastrophe bell."
    end
  end

 private :loop_through_all_stories, :loop_through_story_requirements, :get_corresponding_character_stat, :requirement_eligibility_calculator
end
