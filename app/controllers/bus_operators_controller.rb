class BusOperatorsController < ApplicationController
  before_action :set_bus_operator, only: [:show, :edit, :update, :destroy]

  # GET /bus_operators
  # GET /bus_operators.json
  def index
    @bus_operators = BusOperator.load_from_recorrido
  end

  # GET /bus_operators/1
  # GET /bus_operators/1.json
  def show
  end

  # GET /bus_operators/new
  def new
    @bus_operator = BusOperator.new
  end

  # GET /bus_operators/1/edit
  def edit
  end

  # PATCH/PUT /bus_operators/1
  # PATCH/PUT /bus_operators/1.json
  def update
    respond_to do |format|
      if @bus_operator.update(bus_operator_params)
        format.html { redirect_to @bus_operator, notice: 'Bus operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_operator }
      else
        format.html { render :edit }
        format.json { render json: @bus_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    bus_operators = BusOperator.all
    if params.key?(:order_by_name)
      bus_operators = bus_operators.order(official_name: :asc)
    end

    if params.key?(:order_by_rating)
      bus_operators = bus_operators.order("average_rating desc nulls last")
    end

    page = params[:page].to_i
    page = 1 if page == 0

    respond_to do |format|
      format.html { render plain: :not_acceptable.to_s.humanize, status: :not_acceptable }
      format.json { render json: { data: bus_operators.page(page).per(20), totalCount: BusOperator.count, page: page} }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_operator
      @bus_operator = BusOperator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_operator_params
      params.require(:bus_operator).permit(:description)
    end
end
