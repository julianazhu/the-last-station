class CharactersController < ApplicationController  
  before_action :find_character, only: [:show, :edit, :update, :destroy, :eligible_stories]
  
  def find_character
    @character = Character.find(params[:id])
  end

  def eligible_stories()
  # Outputs an array of all stories whose requirements are met by the player. Or hash, or something. I have no idea. 
    # Story.all.each do |story|                              #Loop through each of the stories
      # story.requirements.each do |requirement|             #Loop through each of the requirements
        # @quality_id = requirement.quality_id
          # @character.stats.each do |stat|                    #Loop through each of the Character's stats
            # @stat_quality_id = stat.quality_id
            # if @stat_quality_id == @quality_id               #Check if the Character has this quality in their stats
              # @stat_amount = @stat.amount
            # else                                             #This Character does not have this quality in their stats. Act as if the Character's stat amount is zero.
              # @stat_amount = 0
            # end
            # @eligibility = eligibility_calculator(:@stat_amount, :@requirement.modifier, :@requirement.amount)
          # end
      # end
    # end
  # end 
  
  # def eligibility_calculator(stat_amount, modifier, requirement_amount)
    # if modifier == "greater than"
      # stat_amount > requirement_amount
    # elsif modifier == "less than"
      # stat_amount < requirement_amount
    # elsif modifier == "equals"
      # stat_amount == requirement_amount
    # else
      # "Error: Modifier is not an accepted value. ABORT. FATAL. Ring the catastrophe bell."
    # end
  end
  
  def play_story(story_id)
    
  end
  
  def index
    @characters = Character.all
  end

  def show
    @stories = Story.all
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
