class Admin::UsersController < ApplicationController

  before_action :authenticate_admin
  def index
  end

  def create
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_update_params)
       redirect_to admin_user_path
     else
       render 'edit'
     end
  end

  # def destroy
  #   User.find(params[:id]).destroy
  #   redirect_to superadmin_users_path
  # end

  private

  def authenticate_admin
    unless current_user.has_role? :admin
      redirect_to root_path
    end
  end

  def user_update_params
    params.require(:user).permit(:name, :age, :country, :gender, :email)
  end


end
