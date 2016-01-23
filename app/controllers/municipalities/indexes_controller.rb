class Municipalities::IndexesController < ApplicationController
  before_action :authenticate_store!
  def index
    @municipality = Municipality.all
  end

  def new
    @municipality = Municipality.new
  end

  def create
    municipality = Municipality.new(create_param)
    municipality.save
    redirect_to action: :index
  end

  def destroy
    municipality = Municipality.find(params[:id])
    municipality.destroy
    redirect_to action: :index
  end

  private

  def create_param
    params.require(:municipality).permit(:name)
  end
end
