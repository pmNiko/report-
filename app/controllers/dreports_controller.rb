class DreportsController < ApplicationController
  before_action :set_dreport, only: [:show, :edit, :update, :destroy]

  def index
    @dreports = Dreport.today
  end

  def new
    @dreport = Dreport.new
  end

  def edit
  end

  # POST /claims
  def create
    @dreport = Dreport.new(dreport_params)
    respond_to do |format|
      if @dreport.save
        format.js
      else
        #flash.now[:success] = "Error dreport create."
        format.js
      end
    end
  end


  # PATCH/PUT /dreports/1
  def update
    @dreport.update(dreport_params)
    @dreport.save
    respond_to do |format|
      format.js
    end
  end

  # DELETE /dreports/1
  def destroy
    @dreport.destroy
    respond_to do |format|
      format.js
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_dreport
    @dreport = Dreport.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def dreport_params
    params
      .require(:dreport)
      .permit(
        {:team_ids =>[]}
      )
  end

end
