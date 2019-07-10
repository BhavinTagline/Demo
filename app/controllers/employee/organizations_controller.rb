class Employee::OrganizationsController < ApplicationController

  def index
    @employee = Employee.find_by_id(current_user.id)
    @organization = current_user.organization
    @departments = @employee.departments.pluck(:name).join(",")
  end

end
