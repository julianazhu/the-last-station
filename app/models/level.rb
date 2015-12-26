  class Level < ActiveRecord::Base
  belongs_to :quality
  delegate :ranked, to: :quality 
  has_many :stats, through: :qualities
  validates :rank,
            presence: true,
            numericality: {only_integer: true}
  validates :description,
            allow_blank: true,
            length: {minimum: 3}
  validates :image_path, 
            allow_blank: true,
            length: {minimum: 3}
  validates :minimum_points,
            numericality: {only_integer: true},
            uniqueness: {scope: :quality_id},
            presence: true

  def self.get_level(quality, points)
    self.where(:quality_id => quality.id).where("minimum_points <= ?", points).order('rank desc').first
  end

  def self.get_level_description(quality, points)
    level = get_level(quality, points)
    if level.blank?
      return ""
    elsif level.ranked
      rank = "#{level.rank}: "
      return (rank or "") + "#{level.description}"
    else
      return "#{level.description}"
    end 
  end

end
