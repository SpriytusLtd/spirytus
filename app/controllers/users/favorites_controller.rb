class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @favorite_stores = @user.favorite_stores.reviews.paginate(page: params[:page], per_page: 5)
  end
end
