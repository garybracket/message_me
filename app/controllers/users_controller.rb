class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :require_user, only: [:edit, :update, :index]
before_action :logged_in_redirect, only: [:new]
# before_action :require_same_user, only: [:edit, :update, :destroy]

  def show

  end

  def index
     @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to MessageMe, #{@user.username}, you're now
      signed up!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account deleted"
    else
    flash[:notice] = "User could NOT be deleted"
    end
  end

  private

  def user_params
  params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in!"
      redirect_to root_path
    end
  end


  # def require_same_user
  #   if current_user != @user && (!current_user.admin? && !current_user.owner?)
  #     flash[:alert] = "You can only edit or delete your own account"
  #     redirect_to @user
  #   end
  # end


end
