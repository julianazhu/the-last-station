class Character < ActiveRecord::Base
  attr_writer :current_step
  attr_reader :deck_size

  has_many :stats, dependent: :destroy
  has_many :fate_cards, dependent: :destroy
  validates :name, presence: true
  validates :avatar_image_path,
            presence: { message: 'Your vision is blurry and your hand-eye coordination is terrible, but you know you can do this. At least...you hope you can.' },
            if: ->(f) { f.current_step == 'avatar' }
  validates_presence_of :gender, if: lambda { |f|
                                       f.current_step == 'gender'
                                     }, message: 'Clearly deeply confused on the issue of your own gender and carrot-hood, but you somehow feel sure that if you just pick something, you can change your mind later and nobody will ever know.'

  def build_initial_character_stats
    character_location = Quality.find_by_name('Location')
    stats.create(quality_id: character_location.id, points: '1')
  end

  def get_stat(quality_name)
    quality = Quality.find_by_name(quality_name)
    stat = Stat.create_with(points: 1).find_or_create_by(quality_id: quality.id, character_id: id)
  end

  def location
    stat = get_stat('Location').get_level
  end

  def deck_size
    quality_id = Quality.find_by(name: 'Deck Size').id
    character_deck_stat = Stat.find_or_create_by(character: self, quality_id: quality_id)
    @deck_size = if character_deck_stat.points?
                   character_deck_stat.points
                 else
                   character_deck_stat.update(points: 3)
                 end
  end

  # Introduction's Form Wizard Logic
  def current_step
    @current_step || steps.first
  end

  def steps
    %w[intro name gender avatar final]
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end
