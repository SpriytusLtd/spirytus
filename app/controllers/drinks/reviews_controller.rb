class Drinks::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @drink = Drink.find(params[:drink_id])
    @reviews = @drink.reviews
    @new_review = DrinkReview.new
    @new_review.drink_id = params[:drink_id]
  end

  def new
    @review = DrinkReview.new
  end

  def create
    @reviews = Drink.find(params[:drink_id]).reviews
    @review = DrinkReview.new(review_params)
    @review.user_id = current_user.id
    @review.drink_id = params[:drink_id]
    flg = 0
    @reviews.each do |r|
      if @review.user_id == r.user_id
        flg = 1
      end
    end
    @review.save if flg == 0
    redirect_to drink_reviews_path
  end

  def edit
    @review = DrinkReview.find(params[:id])
  end

  def show
    @review = DrinkReview.find(params[:id])
  end

  def update
    @review = DrinkReview.find(params[:id])
    @review.update(review_params)
    redirect_to drink_reviews_path
  end

  def destroy
    @review = DrinkReview.find(params[:id])
    @review.destroy
    redirect_to drink_reviews_path
  end

  def review_params
    params.require(:drink_review).permit(:id, :drink_id, :user_id, :body, :param1, :param2, :param3, :param4, :param5, :param6)
  end
end
