class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy, :destroy_requirement]
before_action :find_character, only: [:show, :play_branch]
before_action :locations, only: [:new, :edit, :update]

  def find_story
    @story = Story.find(params[:story_id])
    @branches = @story.branches
  end

  def find_character
    unless params[:character_id].nil?
      @character = Character.find(params[:character_id])
    end
  end

  def locations
    @locations = ["Fate Card"]
      Quality.find_by(:name => "Location").levels.each do |k|
        @locations.push(k.description)
      end
    @locations
  end

  def play_branch
    @branch = Branch.find(params[:branch_id])
    if @branch.story.location == "Fate Card"
      @branch.story.fate_cards.where(:story_id => @branch.story.id, :character_id => @character.id).first.destroy
    end
    @stat_outcomes = @branch.execute_branch_effects(@character) unless @character.nil?
  end
  
  def index
    @stories = Story.all
  end

  def show
  end

  def new
    @story = Story.new
    @story.requirements.build
    @story.branches.build
    @requirements = @story.requirements
  end
  
  def edit
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
    params.require(:story).permit(:title, :body, :image_path, :hook, :location,
                                  requirements_attributes:[ :id, :quality_id, :points , :operation, :_destroy ],
                                  branches_attributes:[ :id, :title, :description, :outcome, :_destroy,  
                                    branch_requirements_attributes:[ :id, :branch_id, :quality_id, :points, :operation, :_destroy ],
                                    effects_attributes:[ :id, :branch_id, :quality_id, :operation, :amount, :_destroy] ])
  end
end