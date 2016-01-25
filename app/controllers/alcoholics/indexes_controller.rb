class Alcoholics::IndexesController < ApplicationController
  before_action :authenticate_store!

  def index
    @alcoholics = Alcoholic.all
  end

  def new
    @alcoholic = Alcoholic.new
  end

  def create
    alcoholic = Alcoholic.new(create_params)
    alcoholic.save
    redirect_to action: :index
  end

  def destroy
    alcoholic = Alcoholic.find(params[:id])
    alcoholic.destroy
    redirect_to action: :index
  end

  private

  def create_params
    params.require(:alcoholic).permit(:name, :item1, :item2, :item3, :item4, :item5, :item6)
  end
end
