class FindEligible
  attr_reader :story_paths

  def initialize(character, story_path_options)
    @character = character
    @story_path_options = story_path_options
    @story_paths = []

    if story_path_options.name == "Story"
      get_evaluated_stories(story_path_options)
    elsif story_path_options.name == "Branch"
      get_evaluated_branches(story_path_options)
    else 
      raise "Eligibility has been sought for a parent class that does not match expected type (story or branch)." 
    end
  end

 private
  def get_evaluated_stories(story_path_options)
    story_path_options.each do |story|
      if story.requirements.empty? 
        @story_paths.push([story, "eligible"])
      else
        story.requirements.each do |requirement| 
          @eligibility = true
          @requirement_eligibility = evaluate_path(story, requirement)
        end
        add_evaluated_path_to_array(story, @eligibility, @requirement_eligibility)
      end
    end
  end

  #This is essentially duplicated from get_evaluated_stories because of the difference between requirements vs branch_requirements,
  #and passing in the parent story or branch would have been ugly.
  def get_evaluated_branches(story_path_options)
    story_path_options.each do |branch|
      if branch.branch_requirements.empty? 
        @story_paths.push([branch, "eligible"])
      else
        branch.branch_requirements.each do |requirement| 
          @eligibility = true
          requirement_eligibility = evaluate_path(branch, requirement)
        end
        add_evaluated_path_to_array(branch, @eligibility, @requirement_eligibility)
      end
    end
  end

  def evaluate_path(path, requirement)
    @character_stat_points = @character.stats.find_by(quality_id: requirement.quality_id).points.presence || 0
    requirement_eligibility_calculator(requirement, @character_stat_points)
  end

  def add_evaluated_path_to_array(path, eligibility, requirement_eligibility)
    if eligibility && requirement_eligibility
      @story_paths.push([path, "eligible"])
    else
      @story_paths.push([path, "ineligible"])
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