class Branch < ActiveRecord::Base
  has_many :effects
  belongs_to :story
  validates :story_id, 
            presence: true
  validates :title,
            presence: true,
            length: { minimum: 5}
  validates :description, 
            presence: true,
            length: { minimum: 5}
  validates :outcome, 
            presence: true,
            length: { minimum: 5}
            
  def self.execute_effects(branch, character)
    @outcomes = []
    branch.effects.each do |effect|
      @stat = character.stats.find_or_initialize_by(:quality_id => effect.quality.id) do |stat|
        stat.points = 0
      end
      # Save temporary information about old stat points
      @old_stat_points = @stat.points 
      # Update the Character's stats per the operation
      calculate_effect_result(effect, effect.operation)
      @stat.save
      outcome_summary = "Your #{effect.quality.name} has #{@operation_description} from #{@old_stat_points} to #{@stat.points}."
      #Create the array of outcomes for the view
      @outcomes.push(outcome_summary)
    end
  end
  
  def self.calculate_effect_result(effect, operation)
    if operation == "plus"
      @stat.points += effect.amount
      @operation_description = "increased"
    elsif operation == "minus"
      @stat.points -= effect.amount
      @operation_description = "decreased"
    else
      raise "Error: Operation is not an accepted value. ABORT. FATAL. Ring the catastrophe bell."
    end
  end
end
