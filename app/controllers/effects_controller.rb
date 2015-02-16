class EffectsController < ApplicationController
  def index
    @effects = Effect.all
  end

  def show
  end

  def new
    @effect = Effect.new
    @qualities = Quality.all
    @outcomes = Outcome.all
    @outcome_id = params[:outcome_id]
      unless @outcome_id.nil?
        @outcome = Outcome.find(@outcome_id)
        @effects = @outcome.effects
      end
  end
  
  def edit
    @effect = Effect.find(params[:id])
    @qualities = Quality.all
    @outcomes = Outcome.all
  end
  
  def create
    @effect = Effect.new(effect_params)
    @qualities = Quality.all
    @outcomes = Outcome.all
    @outcome_id = params[:outcome_id]
    if  @effect.save
      redirect_to :controller => 'effects', 
                  :action => 'new',
                  :outcome_id => @effect.outcome_id
    else
      render 'new'
    end
  end
  
  def update
    @effect = Effect.find(params[:id])
    
    if @effect.update(effect_params)
      redirect_to @effect
    else
      render 'edit'
    end
  end
  
  def destroy
    @effect = Effect.find(params[:id])
    @effect.destroy
    @outcome_id = params[:outcome_id]
    redirect_to :controller => 'effects', 
                :action => 'new',
                :outcome_id => @effect.outcome_id
  end
  
  def effect_params
    params.require(:effect).permit(:outcome_id, :quality_id, :modifier, :amount)
  end
end
