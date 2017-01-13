class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    if current_user.has_reviewed?(@restaurant)
      flash[:notice] = 'You already reviewed this place'
      redirect_to '/restaurants'
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    review = @restaurant.reviews.create(review_params)
    current_user.reviews << review
    if review.save
      redirect_to '/restaurants'
    else
      if review.errors[:user]
        redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
