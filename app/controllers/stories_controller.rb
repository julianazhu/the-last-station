class StoriesController < ApplicationController
before_action :find_story, only: [:new, :show, :edit, :update, :destroy, :update_or_create_requirement]
before_action :set_up_new_requirement, only: [:new, :edit, :update]

  def find_story
      @story = Story.find(params[:story_id])
  end
  
  # Not sure if this is needed any more
  def find_stat(quality_id)
    Stat.where("quality_id = ?", params[:quality_id])
  end

  def set_up_new_requirement
    @requirement = Requirement.new
    @qualities = Quality.all
    @stories = Story.all
  end
  
  def find_story_requirements
    @requirements = @story.requirements
  end

  def update_or_create_requirement
    @qualities = Quality.all
    @story.save
    @requirement = Requirement.find_or_initialize_by(:story_id => @story.id, :quality_id => params[:requirement][:quality_id])
    @requirement.attributes = requirement_params
    if  @requirement.save
      redirect_to :action => 'edit', :story_id => @story.id
    else
      find_story_requirements
      render 'edit'
    end
  end

  def destroy_requirement
    @requirement = Requirement.find(params[:requirement_id])
    @requirement.destroy
    redirect_to new_story_path(@story)
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
    find_story_requirements
  end
  
  def edit
    find_story_requirements
  end
  
  def create
    @story = Story.new(story_params)

    if  @story.save
    redirect_to :action => 'new', :story_id => @story.id
    else
      render 'new'
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
    params.require(:story).permit(:title, :body, :image_path)
  end

  def requirement_params
    params.require(:requirement).permit(:quality_id, :operation, :amount, :story_id)
  end
end