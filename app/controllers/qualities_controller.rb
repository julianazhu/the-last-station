class QualitiesController < ApplicationController
  def index
    @qualities = Quality.all
  end

  def show
    @quality = Quality.find(params[:id])
    @quality = Quality.find(1)
  end

  def new
    @quality = Quality.new
  end
  
  def edit
    @quality = Quality.find(params[:id])
  end
  
  def create
    if Quality.where(name: quality_params[:name]).count > 0
      @quality = Quality.where(name: quality_params[:name]).first
      redirect_to @quality
    else
    @quality = Quality.new(quality_params) 
      if  @quality.save
        redirect_to @quality
      else
        render 'new'
      end
    end
  end
  
  def update
    @quality = Quality.find(params[:id])
    
    if @quality.update(quality_params)
      redirect_to @quality
    else
      render 'edit'
    end
  end
  
  def destroy
    @quality = Quality.find(params[:id])
    @quality.destroy
    
    redirect_to qualities_path
  end
  
  private
  def quality_params
    params.require(:quality).permit(:name, :description, :image_path)
  end
end
