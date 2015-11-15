class AlertsController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :set_beacon, only: [:create, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    org = Organization.find(current_employee.organization_id)
    @alerts = org.alerts
    render "index.json.jbuilder", status: :ok
  end

  # POST /alerts
  # POST /alerts.json
  def create
    # from mac - state, duration, uuid, major, minor
    # we have - current_employee.id , @beacon.id
    @alert = Alert.new(beacon_id: @beacon.id,
                       duration: params[:duration],
                       state: params[:state],
                       employee_id: current_employee.id)
      if @alert.save
       render json: { success: "PREY ACQUIRED! TRACKING MODE ACTIVATED! SCREEEEEEEEE!" }, status: :ok
      else
        render json: { errors: @alert.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beacon
      @beacon = Beacon.find_by(organization_id: current_employee.organization_id, uuid: params[:uuid], major: params[:major], minor: params[:minor])
    end


    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def alert_params
      #params.require(:alert).permit(:beacon_id, :state, :duration, :employee_id)
    #end
end
