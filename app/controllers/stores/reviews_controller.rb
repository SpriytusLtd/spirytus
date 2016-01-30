class Stores::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @store = Store.find_by(params[:store_id])
    @reviews = @store.reviews.paginate(page: params[:page], per_page: 5)
    @new_review = StoreReview.new
  end

  def new
    @review = StoreReview.new
  end

  def create
    @reviews = Store.find(params[:store_id]).reviews
    @review = StoreReview.new(review_params)
    @review.store_id = params[:store_id]
    @review.user_id = current_user.id
    flg = 0
    @reviews.each do |r|
      if @review.user_id == r.user_id
        flg = 1
      end
    end
    if flg == 0
      @review.save
      redirect_to store_reviews_path
    else
      redirect_to store_reviews_path, alert: 'レビューは1件しか投稿できません。'
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
