class Users::IndexesController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id != params[:id].to_i
      redirect_to '/'
    else
      @user = User.find(params[:id])
    end
  end
end
