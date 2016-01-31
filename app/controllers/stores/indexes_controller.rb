class Stores::IndexesController < ApplicationController
  before_action :authenticate_store!, only: [:edit, :update]

  def index
    @info = params[:search]
    @search_criteria = get_search_criteria(@info)
    @resorts = Resort.all
    @drinks = Drink.all
    @dishes = Dish.all
    if @info
      @stores = Store.search(@info).paginate(page: params[:page], per_page: 5)
    else
      @stores = Store.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @store = Store.find(params[:id])
    @relation_to_drinks = @store.store_drinks
    @relation_to_dishes = @store.store_dishes
    @municipality = Municipality.find(@store.municipality_id)
    @store_reviews = StoreReview.search(nil, params[:id])
    @contents = @store.contents
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

  def get_search_criteria(info)
    name = get_name(info)
    resort = get_resort(info)
    drink = get_drink(info)
    dish = get_dish(info)
    '“ ' + name + resort + drink + dish + ' ”'
  end

  def get_name(info)
    if info[:name].blank?
      return ''
    else
      if info.key?(:resort) || info.key?(:drink) || info.key?(:dish)
        info[:name] + ', '
      else
        info[:name]
      end
    end
  end

  def get_resort(info)
    if info.key?(:resort)
      if info.key?(:drink) || info.key?(:dish)
        Resort.find(info[:resort]).name + ', '
      else
        Resort.find(info[:resort]).name
      end
    else
      return ''
    end
  end

  def get_drink(info)
    if info.key?(:drink)
      if info.key?(:dish)
        Drink.find(info[:drink]).name + ', '
      else
        Drink.find(info[:drink]).name
      end
    else
      return ''
    end
  end

  def get_dish(info)
    if info.key?(:dish)
      Dish.find(info[:dish]).name
    else
      return ''
    end
  end
end
