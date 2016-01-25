class Stores::ContentsController < ApplicationController
  before_action :authenticate_store!

  def index
    @contents = current_store.contents
  end

  def create
    redirect_to '/' if current_store.id == params[:store_id].to_i
    content = StoreContent.new(create_params)
    content.store_id = current_store.id
    if content.save
      redirect_to action: :index
    else
      redirect_to action: :index
    end
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
    redirect_to action: :index
  end

  private

  def create_params
    params.require(:store_content).permit(:image, :description, :top)
  end
end
