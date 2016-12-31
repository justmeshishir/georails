class LocationsController < ApplicationController
    def index
        @location = Location.all
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @location }
        end
    end
    
    def new
       @location = Location.new 
    end
    
    def create
        @location = Location.new(location_params) 
        
        respond_to do |format|
            if @location.save
                format.html { redirect_to @location }
                format.json { render :index, status: :created, location: @location }
            else
                format.html { render :new }
                format.json { render json: @locatio.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
      @location = Location.find(params[:id])  
    end
    
    def destroy
       @location = Location.find(params[:id])
       @location.destroy
       redirect_to root_path
    end
    
    def map
       @location = Location.all 
    end
    private
    
    def location_params
        params.require(:location).permit(:location_id, :address, :longitude, :latitude)
    end
end
