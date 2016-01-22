class Users::FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorite_stores = @user.favorite_stores
  end
end
