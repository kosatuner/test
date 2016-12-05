class IndicatorTypesController < ApplicationController
  before_action :set_indicator_type, only: [:show, :edit, :update, :destroy]

  # GET /indicator_types
  # GET /indicator_types.json
  def index
    @indicator_types = IndicatorType.all
  end

  # GET /indicator_types/1
  # GET /indicator_types/1.json
  def show
  end

  # GET /indicator_types/new
  def new
    @indicator_type = IndicatorType.new
  end

  # GET /indicator_types/1/edit
  def edit
  end

  # POST /indicator_types
  # POST /indicator_types.json
  def create
    @indicator_type = IndicatorType.new(indicator_type_params)

    respond_to do |format|
      if @indicator_type.save
        format.html { redirect_to @indicator_type, notice: 'Indicator type was successfully created.' }
        format.json { render :show, status: :created, location: @indicator_type }
      else
        format.html { render :new }
        format.json { render json: @indicator_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicator_types/1
  # PATCH/PUT /indicator_types/1.json
  def update
    respond_to do |format|
      if @indicator_type.update(indicator_type_params)
        format.html { redirect_to @indicator_type, notice: 'Indicator type was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicator_type }
      else
        format.html { render :edit }
        format.json { render json: @indicator_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicator_types/1
  # DELETE /indicator_types/1.json
  def destroy
    @indicator_type.destroy
    respond_to do |format|
      format.html { redirect_to indicator_types_url, notice: 'Indicator type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator_type
      @indicator_type = IndicatorType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_type_params
      params.require(:indicator_type).permit(:nombre, :descripcion)
    end
end
