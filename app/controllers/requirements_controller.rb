class RequirementsController < ApplicationController
  raise
before_action :find_requirement, only: [:edit, :update, :destroy]
before_action :get_all_qualities_and_stories, only: [:new, :edit, :create]
before_action :find_story, only: [:new, :create]

  def get_all_qualities_and_stories
    @qualities = Quality.all
    @stories = Story.all
  end

  def find_story
    if params[:id].blank?
      params[:id] = Story.last.id + 1
    end
    @story = Story.find_or_create_by(:id => params[:id])
    @story.save
  end

  def find_requirement
    @requirement = Requirement.find(params[:id])
  end

  def index
    @requirements = Requirement.all
  end

  def show
  end

  def new
    @requirement = Requirement.new
    @requirements = @story.requirements
  end
  
  def edit
  end
  
  def create
    @requirement = Requirement.find_or_initialize_by(:story_id => @story.id, :quality_id => params[:requirement][:quality_id])
    @requirement.attributes = requirement_params
    if  @requirement.save
      redirect_to :controller => 'stories', :action => 'edit', :id => @requirement.story_id
    else
      render :controller => 'stories', :action => 'edit', :id => @requirement.story_id
    end
  end
  
  def update
    if @requirement.update(requirement_params)
      redirect_to @requirement
    else
      render 'edit'
    end
  end
  
  def destroy
    @requirement.destroy
    @story_id = params[:story_id]
    redirect_to :controller => 'stories', :action => 'edit', :id => @requirement.story_id
  end
  
  def requirement_params
    params.require(:requirement).permit(:quality_id, :operation, :amount, :story_id)
  end
end
