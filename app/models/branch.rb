
class Branch < ActiveRecord::Base
  has_many :effects, :dependent => :destroy
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
            
  def execute_effects(character)
    @outcomes = []

    self.effects.each do |effect|
      @stat = character.stats.find_or_initialize_by(:quality_id => effect.quality.id) do |stat|
        stat.points = 0
      end
      # Update the Character's stats
      @outcome_summary = effect.apply(@stat)
      @outcomes.push(@outcome_summary) unless @outcome_summary.nil?
    end
    @outcomes = @outcomes
  end

end
