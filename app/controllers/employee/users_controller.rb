class Employee::UsersController < ApplicationController

before_action :authenticate_employee
before_action :set_employee, only: [:edit, :show, :update, :destroy]

  def index
    @users = Employee.all
  end

  def create
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def show
  end

  def update
   if @employee.update_attributes(employee_params)
     redirect_to employee_user_path
   else
     render 'edit'
   end
  end

   def destroy
   end

  private

  def authenticate_employee
    unless current_user.has_role? :employee
      redirect_to root_path
    end
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params
      .require(:employee)
      .permit(
              :name,
              :age,
              :country,
              :gender,
              :email,
              :password,
              :password_confirmation,
              user_organization_attributes: [:organization_id, :id],
              department_ids: []
              # departments_attributes: [:id, department_id: []]
              # employee_dept_attributes: [:id, :department_id]
            )
  end

end
