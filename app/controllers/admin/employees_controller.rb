class Admin::EmployeesController < ApplicationController

before_action :set_employee, only: [:edit, :show, :update, :destroy]
# before_action :set_organization, only: [:create]

  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      @employee.remove_role :admin
      @employee.add_role :employee
      redirect_to admin_employees_path
    else
      render 'new'
    end
  end

  def new
    @employee = Employee.new
    @employee.build_user_organization
    @employee.employee_depts.build unless @employee.present?
    @admin_org = current_user.admin_organization
  end

  def edit
    @employee.build_user_organization unless @employee.user_organization.present?
    @admin_org = current_user.admin_organization
  end

  def show
  end

  def update
   if @employee.update_attributes(employee_params)
     redirect_to admin_employees_path
   else
     render 'edit'
   end
  end

   def destroy
     @employee.destroy
     redirect_to admin_employees_path
   end




   # def get_departments
   #   @departments = []
   #   @emp = Employee.find(params[:employee_id]) if params[:employee_id].present?
   #   org_id = params[:organization_id]
   #   organization = Organization.find(org_id)
   #   @departments = organization.departments if organization.present?
   #   # render json: @departments
   #   respond_to do |format|
   #     format.js
   #   end
   # end

  private

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
              # :organization_id,
              user_organization_attributes: [:organization_id, :id],
              department_ids: []
            )
  end

end
