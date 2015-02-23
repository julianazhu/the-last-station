class BranchesController < ApplicationController
before_action :find_branch, only: [:show, :edit, :update, :destroy]

  def find_branch
    @branch = Branch.find(params[:id])
  end
  
  def index
    @branches = Branch.all
  end

  def show
    @branches = Branch.all
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
    params.require(:branch).permit(:story_id, :title, :body, :outcome)
  end
end
