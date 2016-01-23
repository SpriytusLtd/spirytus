class Resorts::IndexesController < ApplicationController
  before_action :authenticate_store!
  def index
    @resorts = Resort.all
  end

  def new
    @resort = Resort.new
  end

  def create
    resort = Resort.new(create_param)
    resort.save
    redirect_to action: :index
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def destroy
    resorts = Resort.find(params[:id])
    resorts.destroy
    redirect_to action: :index
  end

  private

  def create_param
    params.require(:resort).permit(:name, :address, :detail)
  end
end
