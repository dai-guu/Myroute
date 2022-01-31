class MapsController < ApplicationController
  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to map_path(map)
    else
      render new_map_path
    end
  end

  def index
  end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def map_params
    params.require(:map).permit(:title, :description, :address, :latitude, :longitude)
  end
end
