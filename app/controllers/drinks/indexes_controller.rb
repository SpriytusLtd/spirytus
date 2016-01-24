class Drinks::IndexesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    info = params[:search]
    if info
      @drinks = Drink.search(info['name'], info['alcohol'], info['alcoholic'], info['brewer']).paginate(page: params[:page], per_page: 5)
    else
      @drinks = Drink.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def create
    @drink = Drink.new(drink_param)
    if @drink.save
      redirect_to drinks_path
    else
      render 'create'
    end
  end

  def new
    @drink = Drink.new
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(drink_param)
      redirect_to drinks_path
    else
      render 'edit'
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to drinks_path
  end

  private

  def drink_param
    params.require(:drink).permit(:name, :alcohol, :detail, :alcoholic_id, :brewer_id)
  end
end
