class OutcomesController < ApplicationController
  def index
    @outcomes = Outcome.all
  end

  def show
  end

  def new
    @outcome = Outcome.new
    @qualities = Quality.all
    @stories = Story.all
    @story_id = params[:story_id]
      unless @story_id.nil?
        @story = Story.find(@story_id)
        @outcomes = @story.outcomes
      end
  end
  
  def edit
    @outcome = Outcome.find(params[:id])
    @qualities = Quality.all
    @stories = Story.all
  end
  
  def create
    @outcome = Outcome.new(outcome_params)
    @qualities = Quality.all
    @stories = Story.all
    if  @outcome.save
    redirect_to :controller => 'outcomes', 
                :action => 'new',
                :story_id => @outcome.story_id
    else
      render 'new'
    end
  end
  
  def update
    @outcome = Outcome.find(params[:id])
    
    if @outcome.update(outcome_params)
      redirect_to @outcome
    else
      render 'edit'
    end
  end
  
  def destroy
    @outcome = Outcome.find(params[:id])
    @outcome.destroy
    redirect_to :controller => 'outcomes', 
                :action => 'new',
                :story_id => @outcome.story_id
  end
  
  def outcome_params
    params.require(:outcome).permit(:story_id, :title, :body)
  end
end
