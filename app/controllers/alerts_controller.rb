class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)
      if @alert.save
        render "create.json.jbuilder", status: :created
      else
        render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    @alert.update(organization_params)
      if @alert.save
        render "update.json.jbuilder", status: :ok
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
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:beacon, :state, :duration, :employee_id)
    end
end
