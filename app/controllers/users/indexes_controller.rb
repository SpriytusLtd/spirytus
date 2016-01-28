class Users::IndexesController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id != params[:id].to_i
      redirect_to '/'
    else
      @user = User.find(params[:id])
      @drink_reviews = DrinkReview.search(params[:id], nil)
      @store_reviews = StoreReview.search(params[:id], nil)
    end
  end

  def edit
    redirect_to '/' if current_user.id != params[:id].to_i
    @user = User.find(params[:id])
  end

  def update
    redirect_to '/' if current_user.id != params[:id].to_i
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :thumbnail)
  end
end
