class Stores::ConfigurationsController < ApplicationController
  before_action :authenticate_store!

  def index
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @store = Store.find(params[:store_id])
    @have_drinks  = @store.store_drinks
    @have_dishes  = @store.store_dishes
    @close_resorts = @store.resort_stores
  end

  def create
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @drink = StoreDrink.new(store_drinks_params)
    if @drink.save
      redirect_to @store, notice: 'successfully created.'
    else
      redirect_to @store, notice: 'failed'
    end
  end

  def new
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @store = Store.find(params[:store_id])
    @store.store_drinks.build
    @store.dishes.build
    @store.resorts.build
  end

  private

  def store_drinks_params
    params.require(:store).permit(store_drinks_attributes: [:id, :drink_id, :store_id, :_destroy])
  end
  def store_dishes_params
    params.require(:store).permit(dishes_attributes: [:id, :dish_id, :store_id, :_destroy])
  end
  def resort_store_params
    params.require(:store).permit(resorts_attributes: [:id, :resort_id, :store_id, :_destroy])
  end
end
