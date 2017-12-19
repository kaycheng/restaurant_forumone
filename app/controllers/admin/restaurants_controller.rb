class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:edit, :update, :show, :destroy]
  
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was created successfully."
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Restaurant was failed to create."
      render :new
    end
  end

  def edit
    
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant was updated successfully."
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "There was some errors."
      render :edit
    end
  end

  def show

  end

  def destroy
    @restaurant.destroy
    flash[:alert] = "Restaurant was deleted successfully."
    redirect_to admin_restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
