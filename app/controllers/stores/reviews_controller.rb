class Stores::ReviewsController < ApplicationController
  def index
    store = Store.find(params[:store_id])
    @reviews = store
    end

  def new
   @reviews = StoreReview.new
   end

   def create
    @reviews = StoreReview.new(store_reviews_params)
    @reviews.user_id = current_user.id
    @reviews.store_id = params[:store_id]

   if @reviews.save
     redirect_to :action => 'index', notice: 'Store review was successfully created.'
   else
     redirect_to :action => 'index', notice: 'failed'
   end
  end

  def show
    @reviews = StoreReview.find(params[:id])
  end

  private

    def store_id
     params.permit(:store_id)
    end

    def store_reviews_params
     params.require(:store_reviews).permit(:body)
   end

  def edit
   @reviews = StoreReview.find(params[:id])
  end

  def update
    @reviews = StoreReview.find(param[:id])
    @reviews.update(review_params)
    redirect_to store_reviews_path
   end

   def destroy
    @reviews = StoreReview.find(param[:id])
    @reviews.destroy

    redirect_to store_reviews_path
   end
  end
