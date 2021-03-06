class RestaurantsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

  def index
    @user = current_user if current_user
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    user = current_user
    @restaurant = user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to '/restaurants'
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.belongs_to_user?(current_user)
      flash[:notice] = 'Restaurant can only be updated by owner'
      redirect_to '/restaurants'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.user == current_user
      flash[:notice] = 'Restaurant can only be deleted by owner'
      redirect_to '/restaurants'
    end
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
