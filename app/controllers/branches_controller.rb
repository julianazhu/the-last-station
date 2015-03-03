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
  
  def index
    @branches = Branch.all
  end

  def show
    @character = Character.find(params[:character_id])
    @character_id = params[:character_id].to_i
    Branch.execute_effects(@branch, @character) unless @character.nil?
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