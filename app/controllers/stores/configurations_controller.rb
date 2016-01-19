class Stores::ConfigurationsController < ApplicationController
  before_action :authenticate_store!

  def index
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @store = Store.find(params[:store_id])
  end

  def create
    redirect_to '/' if current_store.id != params[:store_id].to_i
    input_store = Store.new(store_params)
    saved_store = Store.find(params[:store_id])
    saved_store.update_attributes name: input_store.name, address: input_store.address, phone_number: input_store.phone_number, budget: input_store.budget, detail: input_store.detail
    redirect_to :store_configurations
  end

  def new
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @store = Store.find(params[:store_id])
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :phone_number, :budget, :detail)
  end
end
