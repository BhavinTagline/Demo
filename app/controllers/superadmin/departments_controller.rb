class Superadmin::DepartmentsController < ApplicationController

  before_action :set_department, only: [:edit, :show, :update, :destroy]

  def index
    @departments = Department.all
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to superadmin_departments_path
    else
      render 'new'
    end
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def update
     if @department.update_attributes(department_params)
       redirect_to superadmin_departments_path
     else
       render 'edit'
     end
   end

   def destroy
     @department.destroy
     redirect_to superadmin_departments_path
   end

   private

   def department_params
     params
      .require(:department)
      .permit(
        :name,
        admin_depts_attributes: [:department_id, :id],
        employee_depts_attributes: [:department_id, :id]
      )
   end

   def set_department
     @department = Department.find(params[:id])
   end

end
