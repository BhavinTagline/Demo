class Superadmin::OrganizationsController < ApplicationController

before_action :set_organization, only: [:edit, :show, :update, :destroy]

    def index
      @organizations = Organization.all
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to superadmin_organizations_path
      else
        render 'new'
      end
    end

    def new
      @organization = Organization.new
      @users = User.with_role :admin
      @users = @users.collect {|user| [user.email, user.id] if user.organization.nil?}.compact
    end

    def edit
      @users = User.with_role :admin
      @users = @users.collect {|user| [user.email, user.id] if user.organization.nil?}.compact
      user = @organization.user
      @users.push([user.email, user.id])
    end

    def update
       if @organization.update_attributes(organization_params)
         redirect_to superadmin_organizations_path
       else
         render 'edit'
       end
     end

     def destroy
       @organization.destroy
       redirect_to superadmin_organizations_path
     end

     # def options_for_select
     #   [
     #   [user.email, user.id]
     # ]
     # end

     private

     def organization_params
       params.require(:organization).permit(:user_id, :name, :address, :email)
     end

     def set_organization
       @organization = Organization.find(params[:id])
     end

  end
