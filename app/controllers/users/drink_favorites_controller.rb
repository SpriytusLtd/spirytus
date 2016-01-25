class Users::DrinkFavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @favorite_drinks = @user.favorite_drinks.paginate(page: params[:page], per_page: 5)
  end
end
