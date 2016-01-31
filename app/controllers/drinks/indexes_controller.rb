class Drinks::IndexesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @info = params[:search]
    @search_criteria = get_search_criteria(@info)
    @alcoholics = Alcoholic.all
    @alcohol = [
      { text: '4%以下', number: 0 },
      { text: '9%以下', number: 1 },
      { text: '19%以下', number: 2 },
      { text: '39%以下', number: 3 },
      { text: '40%以上', number: 4 }
    ]
    logger.debug(@alcohol[0])
    if @info
      @drinks = Drink.search(@info['name'], @info['alcohol'], @info['alcoholic'], @info['brewer']).paginate(page: params[:page], per_page: 5)
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

  def get_search_criteria(info)
    name = get_name(info)
    alcoholic = get_alcoholic(info)
    alcohol = get_alcohol(info)
    '“ ' + name + alcoholic + alcohol + ' ”'
  end

  def get_name(info)
    if info[:name].empty?
      return ''
    else
      info[:name]
    end
  end

  def get_alcoholic(info)
    if info[:alcoholic].empty?
      return ''
    else
      if info[:alcohol].empty?
        Alcoholic.find(info[:alcoholic]).name
      else
        Alcoholic.find(info[:alcoholic]).name + ', '
      end
    end
  end

  def get_alcohol(info)
    alcohol_list = [
      '4%以下',
      '9%以下',
      '19%以下',
      '39%以下',
      '40%以上'
    ]
    if info[:alcohol].empty?
      return ''
    else
      'アルコール度数 : ' + alcohol_list[info[:alcohol]]
    end
  end
end
