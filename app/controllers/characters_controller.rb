class CharactersController < ApplicationController  
  before_action :find_character, only: [:show, :edit, :update, :destroy, :eligible_stories]
  
  def find_character
    @character = Character.find(params[:character_id])
  end

  def index
    @characters = Character.all
  end

  def show
    if @character.nil?
      @stories = Story.all
    else 
      @stories = @character.find_eligible_stories
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
        redirect_to intro_path(@character.id)
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
    params.require(:character).permit(:name, :gender, :avatar_image_path)
  end
end
