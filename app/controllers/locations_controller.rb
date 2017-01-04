class LocationsController < ApplicationController
    def index
        @locations = Location.all
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @locations }
        end
    end
    
    def new
       @location = Location.new 
    end
    
    def create
        @location = Location.new(location_params) 
        
        respond_to do |format|
            if @location.save
                flash[:success] = "Location has been saved!"
                format.html { redirect_to root_path }
                format.json { render :index, status: :created, location: root_path }
                format.js
            else
                flash[:alert] = "Please enter a valid location!"
                format.html { render :new }
                format.json { render json: root_path.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end
    
    def show
      @location = Location.find(params[:id])  
    end
    
    def destroy
       @location = Location.find(params[:id])
       if @location.destroy
        flash[:alert] = "Location has deleted successfully!"
        redirect_to root_path
       end 
    end
   
    private
    
    def location_params
        params.require(:location).permit(:location_id, :address, :longitude, :latitude)
    end
end
