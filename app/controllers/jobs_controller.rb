class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      @job.save
      format.html { redirect_to jobs_url, notice: 'Jobs was successfully created.' }
    end
  end

  def update
    @job.update(job_params)
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params
      .require(:job)
      .permit(
        :code,
        :title
      )
    end
end
