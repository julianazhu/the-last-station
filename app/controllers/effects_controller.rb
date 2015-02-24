class EffectsController < ApplicationController
before_action :find_effect, only: [:show, :edit, :update, :destroy]

  def find_effect
    @effect = Effect.find(params[:id])
  end
  
  def index
    @effects = Effect.all
  end

  def show
    @effects = Effect.all
  end

  def new
    @effect = Effect.new
    @effects = Effect.all
    @qualities = Quality.all
    @branches = Branch.all
    @story_id = params[:story_id]
      unless @story_id.nil?
        @story = Story.find(@story_id)
        @branches = @story.branches
      end
  end
  
  def edit
    @qualities = Quality.all
    @branches = Branch.all
  end
  
  def create
    @effect = Effect.new(effect_params)
    @qualities = Quality.all
    @branches = Branch.all
    @branch_id = params[:branch_id]
    if  @effect.save
      redirect_to :controller => 'effects', 
                  :action => 'new',
                  :branch_id => @effect.branch_id
    else
      render 'new'
    end
  end
  
  def update
    if @effect.update(effect_params)
      redirect_to @effect
    else
      render 'edit'
    end
  end
  
  def destroy
    @effect.destroy
    @branch_id = params[:branch_id]
    redirect_to :controller => 'effects', 
                :action => 'new',
                :branch_id => @effect.branch_id
  end
  
  def effect_params
    params.require(:effect).permit(:branch_id, :quality_id, :operation, :amount)
  end
end
