class Character < ActiveRecord::Base
  attr_reader :character_location
  attr_writer :current_step
    has_many :stats, :dependent => :destroy
    validates :name, 
              :presence => { :message => "Pick a name! Any name! Ideally with letters and everything."},
              format: { with: /\A[a-zA-Z\d ]*\Z/, :message => "You get a strong feeling that your name is made up almost entirely out of letters, and maybe spaces. Numbers probably indicate you have brain damage and/or bad parents, but that's not your fault." },
              :if => lambda { |f| f.current_step == "name" }
    validates :avatar_image_path,
              :presence => { :message =>  "It doesn't look like anything is selected...let's try this again. " },
              :if => lambda { |f| f.current_step == "avatar"}
    validates_presence_of :gender, :if => lambda { |f| f.current_step == "gender"}, :message => "It's a difficult question, but there's a secret: you can just change your mind later. So just pick anything."

  def build_initial_character_stats
    @location_id = Quality.find_by_name("Location").id
    stats.create(quality_id: @location_id, value: "1")
  end

  def get_stat(quality_name)
    quality = Quality.find_by_name(quality_name)
    stat = Stat.where(:quality_id => quality.id, :character_id => self.id)

    readable_stat = [stat_id: stat.id, quality: quality_name, points: stat.points, value: "1"]
    raise
  end

  # Following is the logic for the Intro Form Wizard 
  def current_step
    @current_step || steps.first
  end

  def steps
    %w[intro name gender avatar]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
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
