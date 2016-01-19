class Users::FavoritesController < ApplicationController
  def index
    @user = User.find(params[:id])
      User.favorite(user)    
    @store = Store.find(params[:id])
      Store.favorite(store)
  end
end
