class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.id != params[:user_id].to_i
      redirect_to '/'
    else
      @store_reviews = User.find(params[:user_id]).store_reviews
    end
  end

  def show
    if current_user.id != params[:user_id].to_i
      redirect_to :user_reviews
    else
      @store_review = StoreReview.find(params[:id])
    end
  end
end
