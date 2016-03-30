class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :show]
  before_action :user_admin, only: [:index, :delete]


  before_action :confirm_logged_in
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to(:action => 'index')
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

end
