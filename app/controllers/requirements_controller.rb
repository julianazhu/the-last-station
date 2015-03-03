class RequirementsController < ApplicationController
before_action :find_requirement, only: [:edit, :update, :destroy]
before_action :get_all_qualities_and_stories, only: [:new, :edit, :create]
before_action :find_story, only: [:new, :create]

  def get_all_qualities_and_stories
    @qualities = Quality.all
    @stories = Story.all
  end

  def find_story
    @story = Story.find(params[:story_id])
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
    @requirement = Requirement.new(requirement_params)
    if  @requirement.save
      redirect_to :action => 'new',
                  :story_id => @requirement.story_id
    else
      render 'new'
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
    redirect_to :controller => 'requirements', 
                :action => 'new',
                :story_id => @requirement.story_id
  end
  
  def requirement_params
    params.require(:requirement).permit(:quality_id, :operation, :amount, :story_id)
  end
end
