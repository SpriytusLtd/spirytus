class Stores::ReviewsController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery except: [:index, :review_params, :new, :create, :show, :edit, :update, :destroy, :body]

  def index
    @reviews = Store.find_by(params[:store_id]).reviews.paginate(page: params[:page], per_page: 5)
  end

  def new
    @review = StoreReview.new
  end

  def create
    @review = StoreReview.new(review_params)
    @review.store_id = params[:store_id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to action: 'index', notice: 'Store review was successfully created.'
    else
      redirect_to action: 'index', notice: 'failed'
    end
  end

  def show
    @review = StoreReview.find_by(params[:id])
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

  private

  def review_params
    params.require(:store_review).permit(:id, :store_id, :user_id, :body, :created_at, :updated_at)
  end
end
