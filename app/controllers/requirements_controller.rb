class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.all
  end

  def show
    @requirement = Requirement.find(params[:id])
    @requirements = @requirement.story.requirements
  end

  def new
    @requirement = Requirement.new
    @qualities = Quality.all
    @stories = Story.all
    @story_id = params[:story_id]
      unless @story_id.nil?
        @story = Story.find(@story_id)
        @requirements = @story.requirements
      end
  end
  
  def edit
    @requirement = Requirement.find(params[:id])
    @qualities = Quality.all
    @stories = Story.all
  end
  
  def create
    @requirement = Requirement.new(requirement_params)
    @qualities = Quality.all
    @stories = Story.all
    if  @requirement.save
      redirect_to @requirement
    else
      render 'new'
    end
  end
  
  def update
    @requirement = Requirement.find(params[:id])
    
    if @requirement.update(requirement_params)
      redirect_to @requirement
    else
      render 'edit'
    end
  end
  
  def destroy
    @requirement = Requirement.find(params[:id])
    @requirement.destroy
    
    redirect_to requirements_path
  end
  
  def requirement_params
    params.require(:requirement).permit(:story_id, :quality_id, :modifier, :amount)
  end
end
