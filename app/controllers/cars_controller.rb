class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
     @car_manufacturers = CarManufacturer.all
     @car = Car.new(car_params)

     if @car.save
        flash[:notice] = "Success!"
        redirect_to cars_path
     else
        flash[:notice] = "Error!"
        render :new
     end
  end

  private

  def car_params
    params.require(:car).permit(:car_manufacturer_id, :color, :year, :mileage, :description)
  end
end
