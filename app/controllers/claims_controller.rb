class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update, :destroy]

  def index
    @claims = Claim.all
  end

  def show
  end

  def new
    @claim = Claim.new
    @statuses = Claim.statuses.keys
  end

  def edit
    @statuses = Claim.statuses.keys
  end

  # POST /claims
  def create
    @claim = Claim.new(claim_params)

    respond_to do |format|
      @claim.save
      format.js
    end
  end

  # PATCH/PUT /claims/1
  def update
    respond_to do |format|
      @claim.update(claim_params)
      format.js
    end
  end

  # DELETE /claims/1
  def destroy
    @claim.destroy
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
      params.require(:claim).permit(:ticket, :client, :status, {:user_ids =>[]})
    end
end
