class Stores::ContentsController < ApplicationController
  before_action :authenticate_store!

  def index
    @contents = current_store.contents
  end

  def create
    redirect_to '/' if current_store.id == params[:store_id].to_i
    content = StoreContent.new(create_params)
    content.save
  end

  def new
    @content = StoreContent.new
  end

  def show
    @content = StoreContent.find(params[:id])
  end

  def destroy
    content = StoreContent.find(params[:id])
    content.destroy
    redirect_to :index
  end

  private

  def create_params
    params.require(:content).permit(:image, :description, :top)
  end
end
