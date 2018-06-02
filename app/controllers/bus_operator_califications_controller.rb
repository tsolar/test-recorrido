class BusOperatorCalificationsController < ApplicationController
  before_action :set_bus_operator

  # GET /bus_operator_califications
  # GET /bus_operator_califications.json
  def index
    @bus_operator_califications = BusOperatorCalification.where(bus_operator: @bus_operator)
  end

  # POST /bus_operator_califications
  # POST /bus_operator_califications.json
  def create
    @bus_operator_calification = BusOperatorCalification.new(bus_operator_calification_params)

    respond_to do |format|
      if @bus_operator_calification.save
        format.html { redirect_to bus_operator_califications_path, notice: 'Bus operator calification was successfully created.' }
        format.json { render :show, status: :created, location: @bus_operator_calification }
      else
        # format.html { render :new }
        format.html { render "bus_operators/show" }
        format.json { render json: @bus_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_operator
      @bus_operator = BusOperator.find(params[:bus_operator_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_operator_calification_params
      params.require(:bus_operator_calification).permit(:rating, :comment).merge!(bus_operator_id: @bus_operator.to_param)
    end
end
