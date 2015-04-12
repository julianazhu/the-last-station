class Effect < ActiveRecord::Base
  belongs_to :branch
  belongs_to :quality
  validates :quality_id, 
          presence: true,
          uniqueness: { scope: :branch_id, message: "can't be the same as another effect."}
  validates :operation, 
          presence: true
  validates :amount, 
          presence: true,
          numericality: {only_integer: true}

  def apply(character_stat)
    old_character_stat_points = character_stat.points 
    if operation == "plus"
      character_stat.points += self.amount
      operation_description = "increased"
      character_stat.save
    elsif operation == "minus"
      if self.amount > character_stat.points
        character_stat.points = 0
      else
        character_stat.points -= self.amount
      end
      operation_description = "decreased"
      character_stat.save
    elsif operation == "equals"
      if self.amount > character_stat.points
        operation_description = "increased" 
      else
        operation_description = "decreased" 
      end
      character_stat.save
    else
      raise "Error: Operation is not an accepted value. ABORT. FATAL. Ring the catastrophe bell."
    end
    return "Your #{self.quality.name} has #{operation_description} from #{old_character_stat_points} to #{character_stat.points}."
  end



end
