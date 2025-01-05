class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Failed to create restaurant"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if params[:restaurant][:status] && !current_user.admin?
      redirect_to restaurants_path, alert: "You are not authorized to perform this action."
    else
      @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :cuisine, :website, :phone, :email, :food_rating, :service_rating, :price_rating, :open_time, :close_time, :days_open)
  end
end
