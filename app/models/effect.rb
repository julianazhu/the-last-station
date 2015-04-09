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

  def apply(stat)
    old_stat_points = stat.points 
    if operation == "plus"
      stat.points += self.amount
      operation_description = "increased"
      stat.save
    elsif operation == "minus"
      if self.amount > stat.points
        stat.points = 0
      else
        stat.points -= self.amount
      end
      operation_description = "decreased"
      stat.save
    elsif operation == "equals"
      if self.amount > stat.points
        operation_description = "increased" 
      else
        operation_description = "decreased" 
      end
      stat.save
    else
      raise "Error: Operation is not an accepted value. ABORT. FATAL. Ring the catastrophe bell."
    end
    return "Your #{self.quality.name} has #{operation_description} from #{old_stat_points} to #{stat.points}." unless old_stat_points == 0
  end



end
