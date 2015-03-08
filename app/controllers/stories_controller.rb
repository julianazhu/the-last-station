class StoriesController < ApplicationController
before_action :find_story, only: [:new, :show, :edit, :update, :destroy, :update_or_create_requirement]
before_action :set_up_new_requirement, only: [:new, :edit, :update]

  def find_story
    if params[:id].blank?
      params[:id] = Story.last.id + 1
    end
    @story = Story.find_or_create_by(:id => params[:id])
    @story.save
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
    @requirement = Requirement.find_or_initialize_by(:story_id => @story.id, :quality_id => params[:requirement][:quality_id])
    @requirement.attributes = requirement_params
    if  @requirement.save
      redirect_to edit_story_path
    else
      find_story_requirements
      render 'edit'
    end
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
    redirect_to :action => 'new', :id => @story.id
    else
      render 'new'
    end
  end
  
  def update
    if @story.update(story_params)
      redirect_to :action => 'edit', :id => @story.id
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