class Drinks::IndexesController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def create
    @drinks = Drink.new(drinks_params)
    if @drinks.save
      redirect_to drinks_path
    else
      render 'create'
    end
  end

  def new
    @drinks = Drink.new
  end

  def edit
    @drinks = Drink.find(params[:id])
  end
 
  def show
    @drinks = Drink.find(params[:id])
  end

  def update
    @drinks = Drink.find(params[:id])
    if @drinks.update(drinks_params)
      redirect_to drinks_path
    else
      render 'edit'
    end
  end

  def destroy
    @drinks = Drink.find(params[:id])
    @drinks.destroy
    redirect_to drinks_path
  end

  private
    def drinks_params
      params[:drink].permit(:name, :alcohol, :detail)
    end
end
