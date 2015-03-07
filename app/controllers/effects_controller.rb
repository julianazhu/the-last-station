class EffectsController < ApplicationController
before_action :find_effect, only: [:show, :edit, :update, :destroy]
before_action :get_all_effects, only: [:index, :show, :edit]
before_action :find_root_branch, only: [:new, :create, :edit, :destroy]
before_action :get_all_qualities, only: [:new, :create, :edit]

  def find_effect
    @effect = Effect.find(params[:id])
  end

  def get_all_effects
    @effects = Effect.all
  end

  def find_root_branch
    @branch = Branch.find(params[:branch_id])
    @effects = @branch.effects
  end

  def get_all_qualities
    @qualities = Quality.all
  end
  
  def index
  end

  def show
  end

  def new
    @effect = Effect.new
  end
  
  def edit
    @qualities = Quality.all
  end
  
  def create
    @effect = Effect.find_or_initialize_by(:branch_id => @branch.id, :quality_id => params[:effect][:quality_id])
    @effect.attributes = effect_params
    if  @effect.save
      redirect_to :action => 'new',
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
    redirect_to :action => 'new',
                :branch_id => @effect.branch_id
  end
  
  def effect_params
    params.require(:effect).permit(:branch_id, :quality_id, :operation, :amount)
  end
end
