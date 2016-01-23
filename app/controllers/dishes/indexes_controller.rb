class Dishes::IndexesController < ApplicationController
  before_action :authenticate_store!
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    dish = Dish.new(create_param)
    dish.save
    redirect_to action: :index
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def destroy
    dishes = Dish.find(params[:id])
    dishes.destroy
    redirect_to action: :index
  end

  private

  def create_param
    params.require(:dish).permit(:name, :detail, :image)
  end
end
