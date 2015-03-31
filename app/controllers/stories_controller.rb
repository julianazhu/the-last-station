class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy, :create_requirement, :destroy_requirement]
before_action :set_up_new_requirement, only: [:new, :edit, :update]

  def find_story
      @story = Story.find(params[:story_id])
  end
  

  def set_up_new_requirement
    @requirement = Requirement.new
    @qualities = Quality.all
    @stories = Story.all
  end

  def create_requirement

  end

  def destroy_requirement
    @requirement = Requirement.find(params[:requirement_id])
    @requirement.destroy
    redirect_to edit_story_path(@story)
  end

  def index
    @stories = Story.all
  end

  def show
    unless params[:character_id].nil?
      @character = Character.find(params[:character_id])
    end
  end

  def new
    @story = Story.new
    @story.requirements.build
    @requirements = @story.requirements
  end
  
  def edit
    @story.requirements.build
    @requirements = @story.requirements
  end
  
  def create
    @story = Story.new(story_params)
    if  @story.save
    redirect_to :action => 'edit', :story_id => @story.id
    else
      render 'edit'
    end
  end
  
  def update
    if @story.update(story_params)
      redirect_to :action => 'edit', :story_id => @story.id
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
    params.require(:story).permit(:title, :body, :image_path, requirements_attributes:[ :id, :quality_id, :amount, :operation, :_destroy ])
  end
end