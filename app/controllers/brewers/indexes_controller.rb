class Brewers::IndexesController < ApplicationController
  before_action :authenticate_store!
  def index
    @brewers = Brewer.all
  end

  def new
    @brewer = Brewer.new
  end

  def create
    brewer = Brewer.new(create_param)
    brewer.save
    redirect_to brewers_path
  end

  def destroy
    brewer = Brewer.find(params[:id])
    brewer.destroy
    redirect_to brewers_path
  end

  private

  def create_param
    params.require(:brewer).permit(:name)
  end
end
