class Stores::ReviewsController < ApplicationController
before_action :authenticate_user!
protect_from_forgery except: [:index, :review_params, :new, :create, :show, :edit, :update, :destroy]

  def index
    @store = Store.find_by(params[:store_id])
    end

  def new
   @review = StoreReview.new
   end

   def create
    @reviews = StoreReview.new(reviews_params)
    @reviews.store_id = params[:store_id]
    @reviews.user_id = current_user.id
   if @reviews.save
     redirect_to :action => 'index', notice: 'Store review was successfully created.'
   else
     redirect_to :action => 'index', notice: 'failed'
   end
  end
  def show
    @reviews = StoreReview.find_by(params[:id])
  end


  def edit
   @review = StoreReview.find_by(params[:id])
  end

  def update
    @reviews = StoreReview.find_by(params[:id])
    @reviews.update(review_params)
    redirect_to store_reviews_path
   end

   def destroy
    @reviews = StoreReview.find_by(params[:id])
    @reviews.destroy

    redirect_to store_reviews_path
  end

#private
  def review_params
   params.require(:store_review).permit(:id,:store_id,:user_id,:body,:param1,:param2,:param3,:param4,:param5,:param6,:created_at,:updated_at)
 end
end
