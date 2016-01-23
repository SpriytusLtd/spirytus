class Drinks::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @drink = Drink.find(params[:drink_id])
    @review = DrinkReview.new
  end

  def new
    @review = DrinkReview.new
  end

  def create
    @reviews = DrinkReview.new(review_params)
    @reviews.drink_id = params[:drink_id]
    @reviews.user_id = current_user.id
    @reviews.save
    redirect_to drink_reviews_path
  end

  def edit
    @review = DrinkReview.find(params[:id])
  end

  def show
    @reviews = DrinkReview.find(params[:id])
  end

  def update
    @reviews = DrinkReview.find(params[:id])
    @reviews.update(review_params)
    redirect_to drink_reviews_path
  end

  def destroy
    @reviews = DrinkReview.find(params[:id])
    @reviews.destroy
    redirect_to drink_reviews_path
  end

  def review_params
    params.require(:drink_review).permit(:id, :drink_id, :user_id, :body, :param1, :param2, :param3, :param4, :param5, :param6, :created_at, :updated_at)
  end
end
