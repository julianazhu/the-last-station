class CharactersController < ApplicationController  
  before_action :find_character, only: [:show, :edit, :update, :destroy, :eligible_stories]
  
  def find_character
    @character = Character.find(params[:id])
  end

  def find_eligible_stories()
    @eligible_stories = []
    loop_through_all_stories
  end 
  
  def loop_through_all_stories
    Story.all.each do |story|
      @story_eligibility = true
      if story.requirements.first.nil? 
        @eligible_stories.push(story)
      else
        loop_through_story_requirements(story)
      end
    end
  end
  
  def loop_through_story_requirements(story)
    story.requirements.each do |requirement| 
      corresponding_character_stat = @character.stats.find_by(quality_id: requirement.quality.id) 
      @requirement_eligibility = requirement_eligibility_calculator(requirement, corresponding_character_stat)
      @story_eligibility = @story_eligibility && @requirement_eligibility
      @eligible_stories.push(story) unless @story_eligibility == false
    end
  end
  
  def requirement_eligibility_calculator(requirement, stat)
    if requirement.operation == "greater than"
      stat.points > requirement.amount
    elsif requirement.operation == "less than"
      stat.points < requirement.amount
    elsif requirment.operation == "equals"
      stat.points == requirement.amount
    else
      raise "Error: Operation is not an accepted type. ABORT. FATAL. Ring the catastrophe bell."
    end
  end
  
  def index
    @characters = Character.all
  end

  def show
    if @character.nil?
      @stories = Story.all
    else 
      find_eligible_stories
      @stories = @eligible_stories
    end
    @stats = @character.stats
  end

  def new
    @character = Character.new
  end
  
  def edit
  end
  
  def create
    # Redirect to existing Character if the Character already exists
    if Character.where(name: character_params[:name]).count > 0
      @character = Character.where(name: character_params[:name]).first
      redirect_to @character
    else
    @character = Character.new(character_params) 
      if  @character.save
        redirect_to @character
      else
        render 'new'
      end
    end
  end
  
  def update
    if @character.update(character_params)
      redirect_to @character
    else
      render 'edit'
    end
  end
  
  def destroy
    @character.destroy
    
    redirect_to characters_path
  end
  
  private
  def character_params
    params.require(:character).permit(:name)
  end
end
