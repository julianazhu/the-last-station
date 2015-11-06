  class Level < ActiveRecord::Base
  belongs_to :quality
  validates :amount,
            presence: true,
            numericality: {only_integer: true}
  validates :description,
            allow_blank: true,
            length: {minimum: 3}
  validates :image_path, 
            allow_blank: true,
            length: {minimum: 3}
  validates :minumum_points,
            numericality: {only_integer: true},
            uniqueness: true,
            presence: true

  def get_level_by_stat_points(stat_points)

  end
end
