class Superadmin::UsersController < ApplicationController

  before_action :authenticate_superadmin
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.with_role :admin
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to superadmin_users_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
    @user.admin_depts.build
  end

  def home
      @user = User.new
  end

  def edit
  end

  def show
  end

  def update
     if @user.update(user_params)
       if @user.id == current_user.id
         redirect_to superadmin_user_path
       else
         redirect_to superadmin_users_path
       end
     else
       render 'edit'
     end
   end
     # if current_user
     #   redirect_to superadmin_home_path
     # elsif @user.update_attributes(user_update_params)
     #   redirect_to superadmin_users_path
     # else
     #   render 'edit'
     # end


     def destroy
       @user.destroy
       redirect_to superadmin_users_path
     end


  private

  def authenticate_superadmin
    unless current_user.has_role? :superadmin
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params
      .require(:user)
      .permit(
              :name,
              :age,
              :country,
              :gender,
              :email,
              :password,
              :password_confirmation,
              department_ids: []
            )
    # admin_depts_attributes: [:id, :department_ids]
  end

end
