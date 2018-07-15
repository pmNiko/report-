class ClaimsController < ApplicationController
  before_action :set_claim, only: [ :show, :edit, :update, :destroy,
                                    :contact_to, :review, :finished]

  def begin
    @claim = Claim.find(params[:id])
    @claim.begin
    respond_to do |format|
      format.js
    end
  end

  def coordinate
    @claim = Claim.find(params[:id])
    @claim.contactado!

    @team = Team.find(@claim.team.id)
    @claim_coordinated = Claim.new

    # params["starts_at(4i)"].to_i + 3
    # temporal solution for the zone horarie
    # capturate and create Datetime for cordinate new claims
    somedate = DateTime.new(params["starts_at(1i)"].to_i,
                        params["starts_at(2i)"].to_i,
                        params["starts_at(3i)"].to_i,
                        params["starts_at(4i)"].to_i + 3,
                        params["starts_at(5i)"].to_i)

    @claim_coordinated.author = current_user
    @claim_coordinated.team = @team
    @claim_coordinated.starts_at = somedate
    @claim_coordinated.ticket = @claim.ticket
    @claim_coordinated.client = @claim.client
    @claim_coordinated.coordinado!
    @claim_coordinated.kind = @claim.kind_key
    @claim_coordinated.observation = "<< Previo: " + "#{@claim.observation} >>"
    @claim_coordinated.save!

    respond_to do |format|
      format.js
    end
  end

  def show
    @claim = Claim.find(params[:id])
  end

  def new
    @claim = Claim.new
  end

  def edit
    @statuses = Claim.statusess
    @items = Material.itemss
    @points = Measure.pointss
    @jobs = Job.all
  end

  def create
    @claim = Claim.new(claim_params)

    respond_to do |format|
      @claim.save
      format.js
    end
  end

  def update
    respond_to do |format|
      @claim.update(claim_params)
      if params[:commit] == 'Contact to'
        @claim.contactar!
        @claim.current_end_time
      elsif params[:commit] == 'Review'
        @claim.revisar!
        @claim.current_end_time
      elsif params[:commit] == 'Finished'
        @claim.finalizado!
        @claim.current_end_time
      elsif params[:commit] == 'Visited'
        @claim.contactar!
      elsif params[:commit] == 'Inspect'
        @claim.revisar!
      elsif params[:commit] == 'Close'
        @claim.finalizado!
      end
      format.js
    end
  end

  def destroy
    @claim.destroy_and_child
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params
      .require(:claim)
      .permit(
        {:job_ids =>[]},
        :ticket,
        :client,
        :status,
        :starts_at,
        :ends_at,
        :observation,
        :coordinated,
        materials_attributes: [
          :id,
          :item,
          :quantity,
          :_destroy
        ],
        measures_attributes: [
          :id,
          :point,
          :log,
          :_destroy
        ]
      )
    end
end
