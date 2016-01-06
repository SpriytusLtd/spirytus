class Stores::ReviewsController < ApplicationController
 
 
  def index
    store = Store.find_by(params[:store_id])
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
  @reviews = store_reviews.find_by(params[:id])
  end

private
  def store_reviews_params
   params.require(:store_reviews).permit(:body)
  end
  

  def edit
   @reviews.user_id = current_user.id
   @reviews =store_reviews.find(params[:id])
   @reviews = StoreReview.edit
  end

  def update
   if @reviews.update(store_reviews_params)
      redirect_to :action => 'index', notice: 'Store review was successfully updated.'
   else
      redirect_to :action => 'index', notice: 'failed'
  end
 end
 
  def destroy
   @reviews.destroy
  end
end
