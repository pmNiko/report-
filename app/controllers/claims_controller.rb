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

  def contact_to
    @claim = Claim.find(params[:id])
    @claim.contactar!
    @claim.current_end_time
    redirect_to technician_team_path
  end

  def review
    @claim = Claim.find(params[:id])
    @claim.revisar!
    @claim.current_end_time
    redirect_to technician_team_path
  end

  def finished
    @claim = Claim.find(params[:id])
    @claim.finalizado!
    @claim.current_end_time
    redirect_to technician_team_path
  end

  def coordinate
    @date = params[:starts_at]
    console.log(@date)
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
