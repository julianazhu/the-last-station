class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @characterstat = @character.characterstat
    @characterstats = CharacterStat.all  
  end

  def new
    @character = Character.new
  end
  
  def edit
    @character = Character.find(params[:id])
  end
  
  def create
    # Redirect to existing Character if Character already Exists
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
    @character = Character.find(params[:id])
    
    if @character.update(character_params)
      redirect_to @character
    else
      render 'edit'
    end
  end
  
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    
    redirect_to characters_path
  end
  
  private
  def character_params
    params.require(:character).permit(:name)
  end
end
