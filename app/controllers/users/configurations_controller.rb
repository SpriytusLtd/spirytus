class Users::ConfigurationsController < ApplicationController
  def index
    @users = Userfind(params[:search])   
  end
  
  def create
    @users = User.new(users_params)
    if @users.save
      redirect_to users_path
    else
      render 'create'
    end
  end

  def new
    @users = User.new
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to users_path
  end
end
