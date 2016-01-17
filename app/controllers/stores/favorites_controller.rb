class Stores::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      store = Store.find(params[:store_id])
    rescue
      redirect_to '/'
      return
    end
    store.users_who_likes << current_user
    # current_user.favorite_stores << store
    redirect_to status: :created
  end

  def destroy
    begin
      store = Store.find(params[:store_id])
    rescue
      redirect_to '/'
    end
    store.users_who_likes.delete_if do |u|
      u.id == current_user.id
    end
    redirect_to :store
  end
end
