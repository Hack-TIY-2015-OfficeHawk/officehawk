class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!, only: [:update, :destroy]
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(name: params[:name], owner: params[:username]) #owner: params[:username]
    if @organization.save
      @owner = @organization.employees.new(username: params[:username], 
                               password: params[:password], 
                               organization_id: @organization.id,
                               admin: true)
      if @owner.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @owner.errors.full_messages }, status: :unprocessable_entity
    end

    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    @organization.update(organization_params)
    if @organization.save
      render json: { success: "organization updated successfully"}, status: :ok
    else
      render json: { errors: @orgnanization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    render json: { success: "Organization deleted successfully" }, status: :ok
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.permit(:name, :owner)
    end

end
