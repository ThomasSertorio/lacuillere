class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]
  def index
    @restaurants = Restaurant.all
  end

  def chef
  end

  def top
    @top_restaurants = Restaurant.where(stars: 3)
  end
  def show
  end
  def new
    @restaurant = Restaurant.new
  end
  def edit
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      #redirect_to new_restaurant_path
      render :new
    end
  end














  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
        render :show, status: :ok, location: @restaurant
      else
        render :edit
        render json: @restaurant.errors, status: :unprocessable_entity
      end
    end
  end
  def destroy
    @restaurant.destroy
    respond_to do |format|
      redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
      head :no_content
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :description, :stars)
    end
end
