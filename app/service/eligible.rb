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
        @character_stat = @character.stats.find_by(quality_id: requirement.quality_id) || Stat.new(quality_id: requirement.quality_id, :points => 0)
        return evaluate_by_levels_versus_points(requirement)
      end
    return true
    end
  end

  def evaluate_by_levels_versus_points(requirement)
    if requirement.get_level.blank?
      requirement_eligibility_calculator(requirement, requirement.points, @character_stat.points)
    else
      requirement_eligibility_calculator(requirement, requirement.get_level.minimum_points, @character_stat.get_level.minimum_points)
    end
  end
  
  def requirement_eligibility_calculator(requirement, requirement_minimum, character_stat)
    if requirement.operation == "at least"
      character_stat >= requirement_minimum
    elsif requirement.operation == "less than"
      character_stat < requirement_minimum
    elsif requirement.operation == "is"
      character_stat == requirement_minimum
    elsif requirement.operation == "is not"
      character_stat != requirement_minimum
    else
      raise "Error: Operation is not an accepted type. ABORT. FATAL. Ring the catastrophe bell."
    end
  end

end