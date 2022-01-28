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
    # @map = Map.all
    # gon.place = @map
  end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
  # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
    
    
  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
  end

  def show
  # @map = Map.find(params[:id])

  end



   def map_params
     params.require(:map).permit(:title, :description, :address, :latitude, :longitude)
   end
end
