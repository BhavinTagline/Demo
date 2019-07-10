class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :superadmin?

  def after_sign_in_path_for(resource)
    if resource.has_role? :superadmin
      superadmin_home_path
    elsif resource.has_role? :admin
      new_admin_user_path
    elsif resource.has_role? :employee
      new_employee_user_path
    else
      root_path
    end
  end


  # def superadmin?
  #   # current_user.role = User.where(role: [:superadmin])
  #   current_user.role = User.with_role :superadmin
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :age, :country, :gender, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    # devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    #   user_params.permit(:username, :email)
    # end
  end

end
