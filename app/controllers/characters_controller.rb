class CharactersController < ApplicationController  
  before_action :find_character, only: [:show, :edit, :update, :destroy, :eligible_stories]
  
  def only_eligible_stories
    @stories = []
    FindEligible.new(@character, Story.all).story_paths.each do |path|
      if path.include? "eligible"
        @stories.push(path.first)
      end
    end
    @stories
  end

  def find_character
    @character = Character.find(params[:character_id])
  end

  def index
    @characters = Character.all
  end

  def show
    @stories = only_eligible_stories
    @stats = @character.stats
  end

  def new
    session[:character_params] ||= {}
    @character = Character.new(session[:character_params])
    @character.current_step = session[:character_step]
  end
  
  def edit
  end
  
  def create  
    session[:character_params].deep_merge!(params[:character]) if params[:character]
    @character = Character.new(session[:character_params])
    @character.current_step = session[:character_step]
    if params[:back_button]
      @character.previous_step
      elsif @character.valid?
        if @character.last_step?
          @character.save if @character.all_valid?
        else
         @character.next_step
        end
    end
    session[:character_step] = @character.current_step
    if @character.new_record?
      render "new"
    else
      session[:character_step] = session[:character_params] = nil
      @character.build_initial_character_stats
      redirect_to @character
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
