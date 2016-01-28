class Drinks::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      drink = Drink.find(params[:drink_id])
    rescue
      redirect_to '/'
    end
    redirect_to status: :bad_request if drink.users_who_likes.include?(current_user)

    drink.users_who_likes << current_user
    @drink = Drink.find(params[:drink_id])
    redirect_to drink_path(@drink)
  end

  def destroy
    begin
      drink = Drink.find(params[:drink_id])
    rescue
      redirect_to '/'
    end
    drink.users_who_likes.delete(current_user)
    @drink = Drink.find(params[:drink_id])
    redirect_to drink_path(@drink)
  end
end
