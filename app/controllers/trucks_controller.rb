class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]

  def index
    @trucks = Truck.all
  end

  def show
  end

  def new
    @truck = Truck.new
  end

  def edit
  end

  def create
    @truck = Truck.new(truck_params)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(:number, :brand)
    end
end
