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
    @store = Store.find(current_store.id)
    if @store.update_attributes(create_params)
      redirect_to @store, notice: 'successfully created.'
    else
      redirect_to @store, notice: 'failed'
    end
  end

  def new
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @store = Store.find(params[:store_id])
  end

  private

  def create_params
    params.require(:store).permit(store_drinks_attributes: [:id, :drink_id, :store_id, :_destroy], store_dishes_attributes: [:id, :dish_id, :store_id, :_destroy], resort_stores_attributes: [:id, :resort_id, :store_id, :_destroy])
  end
end
