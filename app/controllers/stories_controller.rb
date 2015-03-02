class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy]

  def find_story
    @story = Story.find(params[:story_id])
  end
  
  def find_stat(quality_id)
    Stat.where("quality_id = ?", params[:quality_id])
  end
  
  def index
    @stories = Story.all
  end

  def show
    @character = Character.find(params[:character_id])
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
        render 'index'
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