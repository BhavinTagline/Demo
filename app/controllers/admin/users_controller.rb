class Admin::UsersController < ApplicationController

  before_action :authenticate_admin
  before_action :set_user_admin, only: [:edit, :show, :update, :destroy]

  def index
  end

  def create
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
     if @user.update_attributes(user_params)
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

  def set_user_admin
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :country, :gender, :email)
  end


end
