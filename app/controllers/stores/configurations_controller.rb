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
    saved_store.update_attributes(
      name: input_store.name,
      address: input_store.address,
      phone_number: input_store.phone_number,
      budget: input_store.budget,
      detail: input_store.detail,
      business_day: input_store.business_day,
      business_time: input_store.business_time,
      transportation: input_store.transportation,
      seat: input_store.seat,
      room: input_store.room,
      banquet_hall_capacity: input_store.banquet_hall_capacity,
      smoking: input_store.smoking,
      hp: input_store.hp
    )
    redirect_to :store_configurations
  end

  def new
    redirect_to '/' if current_store.id != params[:store_id].to_i
    @store = Store.find(params[:store_id])
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :phone_number, :budget, :detail, :business_day, :business_time, :transportation, :seat, :room, :banquet_hall, :banquet_hall_capacity, :smoking, :hp)
  end
end
