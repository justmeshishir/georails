class LocationsController < ApplicationController
    def index
        @location = Location.all
        @hash = Gmaps4rails.build_markers(@location) do |location, marker|
          marker.lat location.latitude
          marker.lng location.longitude
        end
    end
    
    def new
       @location = Location.new 
    end
    
    def create
        @location = Location.create(location_params) 
        if @location.valid?
        redirect_to root_path
        else
        render :new, status: :unprocessable_entity
        end
    end
    
    def show
      @location = Location.find(params[:id])  
    end
    
    private
    
    def location_params
        params.require(:location).permit(:location_id, :address, :longitude, :latitude)
    end
end
