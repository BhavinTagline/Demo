class Superadmin::EmployeesController < ApplicationController

    before_action :set_employee, only: [:edit, :show, :update, :destroy]
    # after_action :assign_default_role, only: [:create]

    def index
      @employees = Employee.all
    end

    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        @employee.remove_role :admin
        @employee.add_role :employee
        redirect_to superadmin_employees_path
      else
        render 'new'
      end
    end

    def new
      @employee = Employee.new
      @employee.build_user_organization
      @employee.employee_depts.build unless @employee.present?
    end

    def edit
      @employee.build_user_organization unless @employee.user_organization.present?
    end

    def show
    end

    def update
     if @employee.update_attributes(employee_params)
       redirect_to superadmin_employees_path
     else
       render 'edit'
     end
    end

     def destroy
       @employee.destroy
       redirect_to superadmin_employees_path
     end

     def get_departments
       @departments = []
       @emp = Employee.find(params[:employee_id]) if params[:employee_id].present?
       org_id = params[:organization_id]
       organization = Organization.find(org_id)
       @departments = organization.departments if organization.present?
       # render json: @departments
       respond_to do |format|
         format.js
       end
     end
       # if organization.present?
       #   user_id = organization.user_id
       #   admin_depts = AdminDept.where(user_id: user_id)
       #   if admin_depts.present?
       #     admin_depts.each do |dept|
       #       dep_id = dept.department_id
       #       tmp_department = Department.find(dep_id)
       #       @departments << {'department_name': tmp_department.name, 'department_id':tmp_department.id}
       #     end
       #     # puts "------------------------ #{@departments}"
       #   # else
       #     # puts "-------------------------- No admin depts present"
       #   end
       # # else
       #   # puts "-------------------------- No organization present"
       # end

      #  respond_to do |format|
      #   format.js
      # end



    private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    # def assign_default_role
    #   self.add_role(:employee) if self.role.blank?
    # end

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
