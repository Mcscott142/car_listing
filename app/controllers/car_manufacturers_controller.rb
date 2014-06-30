class CarManufacturersController < ApplicationController
  def index
    @car_manufacturers = CarManufacturer.all
  end

  def new
    @car_manufacturer = CarManufacturer.new
  end

  def create
     @car_manufacturer = CarManufacturer.new(car_manufacturer_params)

     if @car_manufacturer.save
        flash[:notice] = "Success!"
        redirect_to car_manufacturers_path
     else
        flash[:notice] = "Error!"
        render :new
     end
  end

  private

  def car_manufacturer_params
    params.require(:car_manufacturer).permit(:name, :country)
  end
end
