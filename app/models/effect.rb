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
    original_character_stat_points = character_stat.points 
    calculate_new_character_stat_value(character_stat)
    generate_descriptive_sentence(original_character_stat_points, character_stat)
  end

  def calculate_new_character_stat_value(character_stat)
    if operation == "plus"
      character_stat.points += self.amount
    elsif operation == "minus"
      character_stat.points -= self.amount
    elsif operation == "equals"
      character_stat.points = self.amount 
    end
    character_stat.points = 0 if character_stat.points < 0
    character_stat.save
  end

  def generate_descriptive_sentence(original_character_stat_points, character_stat)
    character_level = get_character_level(character_stat)
    if character_stat.quality.ranked? 
      operation_description = generate_operation_description(original_character_stat_points, character_stat)
      return "Your #{self.quality.name} #{operation_description} #{character_level.amount}: #{character_level.description}."
    else
      return "Your #{self.quality.name} is now #{character_level.description}."
    end
  end

  def generate_operation_description(original_character_stat_points, character_stat)
    if original_character_stat_points < character_stat.points
      operation_description = "has increased to"
    elsif original_character_stat_points > character_stat.points
      operation_description = "has decreased to"
    elsif original_character_stat_points = character_stat.points
      operation_description = "remains"
    end
  end

  def get_character_level(character_stat)
    character_level = 0 
    Level.where(:quality_id => character_stat.quality.id).each do |level|
      if level.minimum_points <= character_stat.points
        character_level = level 
      end
    end
    character_level
  end

end
