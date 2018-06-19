class ClaimsController < ApplicationController
  before_action :set_claim, only: [ :show, :edit, :update, :destroy, :begin,
                                    :contact_to, :review, :finished ]

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
    redirect_to teams_path
  end

  def review
    @claim = Claim.find(params[:id])
    @claim.revisar!
    @claim.current_end_time
    redirect_to teams_path
  end

  def finished
    @claim = Claim.find(params[:id])
    @claim.finalizado!
    @claim.current_end_time
    redirect_to teams_path
  end

  def show
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
