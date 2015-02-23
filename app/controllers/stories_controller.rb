class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy]

  def find_story
    @story = Story.find(params[:id])
  end
  
  def find_stat(quality_id)
    Stat.where("quality_id = ?", params[:quality_id])
  end
  
  def index
    @stories = Story.all
  end

  def show
    if params[:character_id]
      @character = Character.where(id: params[:character_id]).first           #Get the character
      @story.effects.each do |effect|                                         #Get each story effect
        @stat = find_stat(effect.quality_id)
        if @stat.first.nil?   
          @stat = Stat.new(params[:stat])                                     #Move this out into its own method
          @stat.character_id = @character.id
          @stat.quality_id = effect.quality_id
          @stat.points = 0
          @stat.save
        end
        @stat.points += effect.amount
      end
    end
  end

  def new
    @story = Story.new
  end
  
  def edit
  end
  
  def create
    @story = Story.new(story_params)
      if  @story.save
        redirect_to @story
      else
        render 'new'
      end
  end
  
  def update
    if @story.update(story_params)
      redirect_to @story
    else
      render 'edit'
    end
  end
  
  def destroy
    @story.destroy
    redirect_to stories_path
  end
  
  private
  
  def story_params
    params.require(:story).permit(:title, :body, :image_path)
  end
end