class Users::FavoritesController < ApplicationController
  def index
    @users = User.find(params[:id])
      User.favorite(users)
    @stores = Store.find(params[:id])
      Store.favorite(stores)
  end
end
