class Eligible
  attr_reader :eligibility

  def initialize(character, story_or_branch)
    @character = character
    if story_or_branch.class == Story
      @eligibility = evaluate_eligibility(story_or_branch, story_or_branch.requirements)
    elsif story_or_branch.class == Branch
      @eligibility = evaluate_eligibility(story_or_branch, story_or_branch.branch_requirements)
    else 
      raise "Eligibility has been sought for a parent class that does not match expected type (story or branch)." 
    end
  end

 private
  def evaluate_eligibility(story_or_branch, requirements)
    if requirements.empty? 
      return true
    else
      requirements.each do |requirement| 
        @character_stat_points = @character.stats.find_by(quality_id: requirement.quality_id).points.presence || 0
        return false unless requirement_eligibility_calculator(requirement, @character_stat_points)
      end
    return true
    end
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