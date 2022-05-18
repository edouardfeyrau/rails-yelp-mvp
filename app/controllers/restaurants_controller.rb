class RestaurantsController < ApplicationController
  before_action :new_restaurant, only: %i[new]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def new_restaurant
    @restaurant=Restaurant.new
  end
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :rating)
  end
end
