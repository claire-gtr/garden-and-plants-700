class PlantTagsController < ApplicationController

  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @plant = Plant.find(params[:plant_id])
    params[:plant_tag][:tag].each do |tag|
      PlantTag.create(tag: Tag.find(tag.to_i), plant: @plant)
    end
    redirect_to garden_path(@plant.garden)
  end

  def destroy
    @plant_tag = PlantTag.find(params[:id])
    @garden = @plant_tag.plant.garden
    @plant_tag.destroy
    redirect_to garden_path(@garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end

end
