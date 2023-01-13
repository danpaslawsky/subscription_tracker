class UsersController < ApplicationController
  
  
  def index 
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
