class Branch < ActiveRecord::Base
  belongs_to :story
  has_many :effects, :dependent => :destroy
  accepts_nested_attributes_for :effects,
                                :reject_if => :all_blank, 
                                :allow_destroy => true
  validates :story_id, 
            presence: true
  validates :title,
            allow_blank: true,
            length: { minimum: 5}
  validates :description, 
            allow_blank: true,
            length: { minimum: 5}
  validates :outcome, 
            allow_blank: true,
            length: { minimum: 5}

            
  def execute_branch_effects(character)
    @outcomes = []

    self.effects.each do |effect|
      @stat = character.stats.find_or_initialize_by(:quality_id => effect.quality.id) do |stat|
        stat.points = 0
      end
      @outcome_summary = effect.apply(@stat)
      @outcomes.push(@outcome_summary) unless @outcome_summary.nil?
    end
    return @outcomes
  end

end
