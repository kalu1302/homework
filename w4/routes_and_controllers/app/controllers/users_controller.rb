class UsersController < ApplicationController

  def new
    render :new
  end

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
