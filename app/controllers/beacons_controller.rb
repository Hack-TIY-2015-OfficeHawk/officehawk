class BeaconsController < ApplicationController
  before_action :set_beacon, only: [:update, :destroy]
  before_action :authenticate_employee!
  before_action :set_organization

  def index
    if current_employee.admin
      @beacons = @org.beacons.all
      render "index.json.jbuilder", status: :ok
    else
      render json: { errors: "You need to be an admin to do that!" }
    end
  end

  def create
    if current_employee.admin
      @beacon = @org.beacons.new(uuid: params[:uuid], major: params[:major], minor: params[:minor])
      if @beacon.save
        render "new.json.jbuilder", status: :created
      else
        render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "You need to be an admin to do that!" }
    end
  end

  def update
    if current_employee.admin
      params[:uuid] ||= @beacon.uuid
      params[:major] ||= @beacon.major
      params[:minor] ||= @beacon.minor

      @beacon.update(uuid: params[:uuid], major: params[:major], minor: params[:minor])
      render json: { success: "Beacon updated successfully" }, status: :ok
    else
      render json: { errors: "You don't have permission to update that beacon" }, status: :unathorized
    end
  end

  def destroy
    if current_employee.admin
      @beacon.destroy
      render json: { success: "Beacon deleted successfully" }, status: :ok
    else
      render json: { errors: "You don't have permission to delete that beacon" }, status: :unauthorized
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    @beacon = Beacon.find(params[:id])
  end

  def set_organization
    @org = Organization.find_by(id: current_employee.organization_id)
  end

end