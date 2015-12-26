class FindEligible
  attr_reader :paths

  def initialize(character, parent_class)
    @character = character
    @parent_class = parent_class
    @paths = []

    if parent_class.name == "Story"
      get_evaluated_stories
    elsif parent_class.name == "Branch"
      get_evaluated_branches
    else 
      raise "Eligibility has been sought for a parent class that does not match expected type (story or branch)." 
    end
  end

 private
  def get_evaluated_stories
    Story.all.each do |story|
      if story.requirements.empty? 
        @paths.push([story, "eligible"])
      else
        story.requirements.each do |requirement| 
          @eligibility = true
          evaluate_path(story, requirement)
        end
      end
    end
  end

  #This is essentially duplicated from get_evaluated_stories because of the difference between requirements vs branch_requirements,
  #and passing in the parent story or branch would have been ugly.
  def get_evaluated_branches
    Branch.all.each do |branch|
      if branch.branch_requirements.empty? 
        @paths.push([branch, "eligible"])
      else
        branch.branch_requirements.each do |requirement| 
          @eligibility = true
          evaluate_path(branch, requirement)
        end
      end
    end
  end

  def evaluate_path(path, requirement)
    @character_stat_points = get_character_stat_points(requirement)
    @requirement_eligibility = requirement_eligibility_calculator(requirement, @character_stat_points)
    if @eligibility && @requirement_eligibility
      @paths.push([path, "eligible"])
    else
      @paths.push([path, "ineligible"])
    end
  end

  def get_character_stat_points(requirement)
    return @character.stats.find_by(quality_id: requirement.quality_id).points.presence || 0
  end
  
  def requirement_eligibility_calculator(requirement, character_stat_points)
    if requirement.operation == "greater than"
      character_stat_points > requirement.points
    elsif requirement.operation == "less than"
      character_stat_points < requirement.points
    elsif requirement.operation == "is"
      character_stat_points == requirement.points
    elsif requirement.operation == "is not"
      character_stat_points != requirement.points
    else
      raise "Error: Operation is not an accepted type. ABORT. FATAL. Ring the catastrophe bell."
    end
  end

end