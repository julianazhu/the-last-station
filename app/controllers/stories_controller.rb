class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy, :destroy_requirement]

  def find_story
    @story = Story.find(params[:story_id])
    @branches = @story.branches
  end
  
  def index
    @stories = Story.all
  end

  def show
    unless params[:character_id].nil?
      @character = Character.find(params[:character_id])
    end
  end

  def new
    @story = Story.new
    @story.requirements.build
    @requirements = @story.requirements
  end
  
  def edit
    @requirements = @story.requirements
  end
  
  def create
    @story = Story.new(story_params)
    if  @story.save
    redirect_to :action => 'edit', :story_id => @story.id
    else
      render 'edit'
    end
  end
  
  def update
    if @story.update(story_params)
      redirect_to :action => 'edit', :story_id => @story.id
    else
      render 'edit'
    end
  end
  
  def destroy
    @story.destroy
    redirect_to stories_path
  end
  
  private
  def story_params
    params.require(:story).permit(:title, :body, :image_path, 
                                  requirements_attributes:[ :id, :quality_id, :amount, :operation, :_destroy ],
                                  branches_attributes:[ :id, :story_id, :title, :description, :outcome, :_destroy,  
                                    effects_attributes:[ :id, :branch_id, :quality_id, :operation, :amount, :_destroy] ])
  end
end