class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def search
  end

  def daily_report
    authorize Team
    @daily_reports = Team.today
  end

  def home
    authorize Team
    @teams = Team.all
    @user = current_user

    if @user.has_role? :admin
      redirect_to teams_path
    elsif @user.has_role? :dir
      redirect_to dir_team_path
    elsif @user.has_role? :technician
      redirect_to technician_team_path
    else
      redirect_to new_user_session_path
    end
  end

  def home_technician
    authorize Team
    @user = current_user
    @dreport = @user.dreports.today.first
    @team = @user.teams.today.first
    @team.comprobation unless @team.nil?
  end

  def home_dir
    authorize Team
    @teams = Team.today
    @user = current_user
    @user = Ticket.new
  end

  def index
    authorize Team
    @teams = Team.today
  end

  def new
    @team = Team.new
    authorize @team
    @users = User.with_role(:technician)
    @kinds = Claim.kindss
    @trucks = Truck.all
  end

  def edit
    authorize Team
    @users = User.all
    @trucks = Truck.all
    @kinds = Claim.kindss
  end

  # POST /claims
  def create
    authorize Team
    @team = Team.new(team_params)
    @team.add_authors(current_user)
    @team.give_priority
    respond_to do |format|
      if @team.save
        format.js { flash.now[:notice] = "The team was created" }
      else
        #flash.now[:success] = "Error team create."
        format.js { flash.now[:notice] = "Error create team" }
      end
    end
  end


  # PATCH/PUT /teams/1
  def update
    authorize Team
    @team.update(team_params)
    @team.comprobation
    @team.add_authors(current_user)
    @team.save
    respond_to do |format|
      format.js { flash.now[:notice] = "The team was updated" }
    end
  end

  # DELETE /teams/1
  def destroy
    authorize Team
    unless @team.working?
      @team.destroy_and_child
    end
    respond_to do |format|
      format.js { flash.now[:notice] = "The team was destroy" }
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
