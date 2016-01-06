class Drinks::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    #後で修正where使用
  
    @drink = Drink.find(params[:drink_id])
  end

  def new
    @review = DrinkReview.new
  end

  def create
    @reviews = DrinkReview.new(review_params)
    #後で修正
    @reviews.drink_id = params[:drink_id]
    @reviews.user_id = current_user.id
    @reviews.save
    redirect_to drink_reviews_path #,id: @reviews.id
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
    redirect_to drink_reviews_path #,id: @reviews.id
  end

  def destroy
    @reviews = DrinkReview.find(params[:id])
    @reviews.destroy

    redirect_to drink_reviews_path
  end

  private
    def drink_id
     params.permit(:drink_id)
  #    params.require(:drink_reviews).permit(:id,:drink_id,:user_id,:body,:param1,:param2,:param3,:param4,:param5,:param6)
    end


    def review_params
      params.require(:drink_review).permit(:id,:drink_id,:user_id,:body ,:param1,:param2,:param3,:param4,:param5,:param6,:created_at,:updated_at)

    end

end
