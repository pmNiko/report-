class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
    @users = User.all
    @kinds = Claim.kinds.keys
  end

  def edit
    @users = User.all
    @kinds = Claim.kinds.keys 
  end

  # POST /claims
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      @team.save
      format.js
    end
  end

  # PATCH/PUT /teams/1
  def update
    respond_to do |format|
      @team.update(team_params)
      format.js
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy_and_child
    respond_to do |format|
      format.js
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params
      .require(:team)
      .permit(
        {:user_ids =>[]},
        :claims,
        :date,
        :truck,
        claims_attributes: [
        :id,
        :ticket,
        :client,
        :_destroy
        ])
  end
end
