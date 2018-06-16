class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  def index
    @measures = Measure.all
  end

  def show
  end

  def new
    @measure = Measure.new
  end

  def edit
    @points = Measure.pointss
  end

  def create
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to @measure, notice: 'Measure was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @measure.update(measure_params)
        format.html { redirect_to @measure, notice: 'Measure was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @measure.destroy
    respond_to do |format|
      format.html { redirect_to measures_url, notice: 'Measure was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_params
      params.require(:measure).permit(:log, :point)
    end
end
