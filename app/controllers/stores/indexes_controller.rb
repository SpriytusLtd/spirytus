class Stores::IndexesController < ApplicationController
  before_action :authenticate_store!, only: [:edit, :update]

  def show
    @store = Store.find(params[:id])
    @reration_to_drinks = @store.store_drinks
    @municipality = Municipality.find(@store.municipality_id)
    @store_reviews = StoreReview.search(nil, params[:id])
  end

  def edit
    redirect_to '/' if current_store.id != params[:id].to_i
    @store = Store.find(params[:id])
  end

  def update
    redirect_to '/' if current_store.id != params[:id].to_i
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      redirect_to action: :show
    else
      redirect_to action: :edit
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :email, :municipality_id, :address, :phone_number, :budget, :detail, :image, :business_day, :business_time, :transportation, :seat, :room, :banquet_hall, :banquet_hall_capacity, :smoking, :hp)
  end
end
