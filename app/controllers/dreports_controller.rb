class DreportsController < ApplicationController
  before_action :set_dreport, only: [:show, :edit, :update, :destroy]

  def index
    @dreports = Dreport.today
  end

  def end_shift
    team = Team.find(params[:id])
    @dreport = Dreport.new
    @dreport.save!
    @dreport.load_parameters(team)
    team.finalize
    redirect_to dreport_path(@dreport)
  end

  def show

  end

  def current
    @dreport = Dreport.last
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
