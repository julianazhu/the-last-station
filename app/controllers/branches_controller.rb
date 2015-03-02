class BranchesController < ApplicationController
before_action :find_branch, only: [:show, :edit, :update, :destroy]
before_action :get_all_qualities_and_stories, only: [:new, :edit, :create]

  def find_branch
    @branch = Branch.find(params[:branch_id])
  end
  
  def get_all_qualities_and_stories
    @qualities = Quality.all
    @stories = Story.all
  end
  
  def execute_effects
    @outcomes = []
    @branch.effects.each do |effect|
      @stat = @character.stats.find_or_initialize_by(:quality_id => effect.quality.id) do |stat|
        stat.points = 0
      end
      # Save temporary information about old stat points
      @old_stat_points = @stat.points 
      # Update the Character's stats per the operation
      calculate_effect_result(effect, effect.operation)
      @stat.save
      outcome_summary = "Your #{effect.quality.name} has #{@operation_description} from #{@old_stat_points} to #{@stat.points}."
      #Create the array of outcomes for the view
      @outcomes.push(outcome_summary)
    end
  end
  
  def calculate_effect_result(effect, operation)
    if operation == "plus"
      @stat.points += effect.amount
      @operation_description = "increased"
    elsif operation == "minus"
      @stat.points -= effect.amount
      @operation_description = "decreased"
    else
      raise "Error: Operation is not an accepted value. ABORT. FATAL. Ring the catastrophe bell."
    end
  end
  
  def index
    @branches = Branch.all
  end

  def show
    @character = Character.find(params[:character_id])
    @character_id = params[:character_id].to_i
    execute_effects unless @character.nil?
  end

  def new
    @branch = Branch.new
    @story_id = params[:story_id]
      unless @story_id.nil?
        @story = Story.find(@story_id)
        @branches = @story.branches
      end
  end
  
  def edit
  end
  
  def create
    @branch = Branch.new(branch_params)
    if  @branch.save
    redirect_to :controller => 'branches', 
                :action => 'new',
                :story_id => @branch.story_id
    else
      render 'new'
    end
  end
  
  def update
    if @branch.update(branch_params)
      redirect_to @branch
    else
      render 'edit'
    end
  end
  
  def destroy
    @branch.destroy
    redirect_to :controller => 'branches', 
                :action => 'new',
                :story_id => @branch.story_id
  end
  
  def branch_params
    params.require(:branch).permit(:story_id, :title, :description, :outcome)
  end
end