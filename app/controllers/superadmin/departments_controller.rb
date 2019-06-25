class Superadmin::DepartmentsController < ApplicationController

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
    @department = Department.find(params[:id])
  end

  def update
   @department = Department.find(params[:id])
     if @department.update_attributes(department_params)
       redirect_to superadmin_departments_path
     else
       render 'edit'
     end
   end

   def destroy
     Department.find(params[:id]).destroy
     redirect_to superadmin_departments_path
   end

   private

   def department_params
     params.require(:department).permit(:name)
   end

end
