class Stores::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      store = Store.find(params[:store_id])
    rescue
      redirect_to '/'
    end
    redirect_to status: :bad_request if store.users_who_likes.include?(current_user)

    store.users_who_likes << current_user
    redirect_to status: :created
  end

  def destroy
    begin
      store = Store.find(params[:store_id])
    rescue
      redirect_to '/'
    end
    store.users_who_likes.delete(current_user)
    redirect_to status: :created
  end
end
