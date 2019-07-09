class Admin::OrganizationsController < ApplicationController

before_action :set_organization, only: [:edit, :show, :update, :destroy]

    def index
      @organizations = Organization.all
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to admin_organizations_path
      else
        render 'new'
      end
    end

    def show
    end

    def new
      # @organization = Organization.new
      # @users = User.all
      # @users = @users.collect {|user| [user.email, user.id] if user.admin_organization.nil?}.compact
    end

    def edit
      # authorize! :update, @organization
    #   @users = Admin.all
    #   @users = @users.collect {|user| [user.email, user.id] if user.admin_organization.nil?}.compact
    #   user = @organization.user
    #   @users << ([user.email, user.id])

    end

    def update
       if @organization.update_attributes(organization_params)
         redirect_to admin_organizations_path
       else
         render 'edit'
       end
     end

     def destroy
       @organization.destroy
       redirect_to admin_organizations_path
     end

     private

     def organization_params
       params
       .require(:organization)
       .permit(
         :user_id,
         :name,
         :address,
         :email,
         # department_ids: [],
         # :organization_id
       )
     end

     def set_organization
       @organization = Organization.find(params[:id])
     end

end
