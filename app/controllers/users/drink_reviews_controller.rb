class Users::DrinkReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.id != params[:user_id].to_i
      redirect_to '/'
    else
      @drink_reviews = User.find(params[:user_id]).drink_reviews
    end
  end

  def show
    if current_user.id != params[:user_id].to_i
      redirect_to controller: 'users/indexes', action: :index
    else
      @drink_review = drinkReview.find(params[:id])
    end
  end
end
