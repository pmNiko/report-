class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @users = User.all
    @kinds = Claim.kindss
    @trucks = Truck.all
  end

  def edit
    @users = User.all
    @trucks = Truck.all
    @kinds = Claim.kindss
  end

  # POST /claims
  def create
    @team = Team.new(team_params)
    @team.add_authors(current_user)
    respond_to do |format|
      if @team.save
        format.js
      else
        #flash.now[:success] = "Error team create."
        format.js
      end
    end
  end

  # PATCH/PUT /teams/1
  def update
    respond_to do |format|
      if @team.update(team_params)
        @team.add_authors(current_user)
        #flash.now[:success] = "Team to truck: "+@team.truck+" it was updated."
        format.js
      else
        #flash.now[:success] = "Team to truck: "+@team.truck+" could not be updated."
        format.js
      end
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
        :date,
        :truck_id,
        claims_attributes: [
          :id,
          :ticket,
          :client,
          :kind,
          :_destroy
        ]
      )
  end

end
