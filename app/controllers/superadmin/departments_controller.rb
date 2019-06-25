class Superadmin::DepartmentsController < ApplicationController

  def index
    @department = Department.new
  end

end
