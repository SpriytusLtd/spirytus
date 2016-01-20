class Drinks::IndexesController < ApplicationController
  def index
    info = params[:search]
    if info
      @drinks = Drink.search(info['name'], info['alcohol'], info['alcoholic'], info['brewer'])
    else
      @drinks = Drink.all
    end
  end

  def create
    @drinks = Drink.new(drink_param)
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
    if @drinks.update(drink_param)
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

  def drink_param
    params[:drink].permit(:name, :alcohol, :detail, :alcoholic, :brewer)
  end
end
