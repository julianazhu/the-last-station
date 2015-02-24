class BranchesController < ApplicationController
before_action :find_branch, only: [:show, :edit, :update, :destroy]

  def find_character
    @character = Character.find(params[:character_id])
  end

  def find_branch
    @branch = Branch.find(params[:branch_id])
  end
  
  def check_stat_exists
    if @stat.nil?
      create_blank_character_stat
    end
  end
  
  def create_blank_character_stat
    @new_stat = Stat.new()
    @new_stat.character_id = @character_id
    @new_stat.quality_id = @quality_id
    @new_stat.points = 0
    @new_stat.save
    @stat = @new_stat
  end
  
  def execute_effects
    @outcomes = []
    @branch.effects.each do |effect|
      # Compare the Character's Qualities with each of the Story branch effects.   
      @quality_id = effect.quality_id
      @quality = Quality.find_by(:id => @quality_id)
      @stat = Stat.find_by(character_id: @character_id, quality_id: @quality_id)
      check_stat_exists
      # Save temporary information about old stat points
      @old_stat_points = @stat.points 
      # Update the Character's stats per the operation
      @stat.points += effect.amount
      @stat.save
      outcome_summary = "Your #{@quality.name} has increased from #{@old_stat_points} to #{@stat.points}."
      #Create the array of outcomes for the view
      @outcomes.push(outcome_summary)
    end
  end
  
  def index
    @branches = Branch.all
  end

  def show
    @character = Character.find(params[:character_id])
    @character_id = params[:character_id].to_i
    unless @character.nil?
      execute_effects
    end
  end

  def new
    @branch = Branch.new
    @qualities = Quality.all
    @stories = Story.all
    @story_id = params[:story_id]
      unless @story_id.nil?
        @story = Story.find(@story_id)
        @branches = @story.branches
      end
  end
  
  def edit
    @qualities = Quality.all
    @stories = Story.all
    
  end
  
  def create
    @branch = Branch.new(branch_params)
    @qualities = Quality.all
    @stories = Story.all
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