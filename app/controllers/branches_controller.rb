class BranchesController < ApplicationController
before_action :find_branch, only: [:show, :edit, :destroy, :update, :update_or_create_effect]
before_action :get_all_qualities_and_stories, only: [:new, :edit, :create, :update_or_create_effect]
before_action :get_root_story, only: [:new, :create, :edit, :update_or_create_effect]
before_action :new_effect, only: [:new, :edit]

  def find_branch
    unless params[:branch_id].nil? 
      @branch = Branch.find(params[:branch_id])
    end
  end
  
  def get_all_qualities_and_stories
    @qualities = Quality.all
    @stories = Story.all
  end

  def get_root_story
    @story_id = params[:story_id]
    unless @story_id.nil?
      @story = Story.find(@story_id)
      @branches = @story.branches
    end
  end

  def redirect_to_new_branch
    redirect_to :action => 'new'
  end

  def destroy_effect
    @effect = Effect.find(params[:effect_id])
    @effect.destroy
    redirect_to new_branch_path(@branch)
  end

  def new_effect
    @effect = Effect.new
  end

  def build_effects_for_each_branch
    @branches.each do |b|
      b.effects.build
    end
  end

  def index
    @branches = Branch.all
  end

  def show
    @character = Character.find(params[:character_id])
    @character_id = params[:character_id].to_i
    @outcomes = @branch.execute_branch_effects(@character) unless @character.nil?
  end

  def new
    @branch = Branch.new
    build_effects_for_each_branch
  end
  
  def edit
    @branches = Branch.all
    build_effects_for_each_branch
  end
  
  def create
    @branch = Branch.new(branch_params)
    if  @branch.save
      redirect_to_new_branch
    else
      render 'new'
    end
  end
  
  def update
    if @branch.update(branch_params)
      redirect_to :action => 'edit'
    else
    raise 
      render 'edit'
    end
  end
  
  def destroy
    @branch.destroy
    redirect_to_new_branch
  end

  private
  def branch_params
    params.require(:branch).permit(:story_id, :title, :description, :outcome, 
                                   effects_attributes:[:id,:branch_id, :quality_id, :operation, :amount, :_destroy])
  end
end