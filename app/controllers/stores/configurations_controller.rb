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
    blank_check(params)
    uniq_check(params)
    if @store.update_attributes(create_params)
      redirect_to store_configurations_path, notice: 'successfully created.'
    else
      redirect_to store_configurations_path, notice: 'failed'
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

  def blank_check(req)
    req[:store].each do |r|
      r[1].each do |rr|
        if rr[1][:drink_id].blank? && rr[1][:dish_id].blank? && rr[1][:resort_id].blank?
          r[1].delete(rr[0])
        end
      end
    end
  end

  def uniq_check(req)
    uniq_check_drink(req) if req[:store][:store_drinks_attributes]
    uniq_check_dish(req) if req[:store][:store_dishes_attributes]
    uniq_check_resort(req) if req[:store][:resort_stores_attributes]
  end

  def uniq_check_drink(req)
    ids = []
    req[:store][:store_drinks_attributes].each do |r|
      if ids.include?(r[1][:drink_id])
        req[:store][:store_drinks_attributes].delete(r[0])
      else
        ids << r[1][:drink_id]
      end
    end
  end

  def uniq_check_dish(req)
    ids = []
    req[:store][:store_dishes_attributes].each do |r|
      if ids.include?(r[1][:dish_id])
        req[:store][:store_dishes_attributes].delete(r[0])
      else
        ids << r[1][:dish_id]
      end
    end
  end

  def uniq_check_resort(req)
    ids = []
    req[:store][:resort_stores_attributes].each do |r|
      if ids.include?(r[1][:resort_id])
        req[:store][:resort_stores_attributes].delete(r[0])
      else
        ids << r[1][:resort_id]
      end
    end
  end
end
