class UsersController < ApplicationController
  

  # render signup form
  # instantiate an empty new user object to wrap(encapsulate) the login form around it
  def new
    if !logged_in?
      @user = User.new
    else
      redirect_to root_path  
    end
  end

  # resposible for proccesing signup form
  def create
    user = User.new(user_params)
    if user.save
      # log user in
      # [key] and set that to new users id
      session[:user_id] = user.id
      redirect_to root_path
    else
      # show errors with validation errors
      # make them try again
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end 

  def destroy
  end

  private

  def user_params
    # require :user hash and permit the fileds user will submit
    params.require(:user).permit(:username, :email, :password)
  end

end
