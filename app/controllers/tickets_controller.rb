class TicketsController < ApplicationController
  before_action :set_ticket, only: [ :show]

  def search
    nt = params["nt"]
    sma = "sma_" + params["sma"]
    tickets_nt = Ticket.client(nt)
    tickets_sma = Ticket.client(sma)

    @client = nil
    if !nt.nil?
      @client = "#{nt}"
      unless sma.nil?
        @client = "#{@client}" + "  " +"#{sma}"
      end
    else
      unless sma.nil?
        @client = "#{sma}"
      end
    end

    @ticket_all = []

    unless tickets_nt.empty?
      tickets_nt.each do |ticket|
        @ticket_all << ticket
      end
    end

    unless tickets_sma.empty?
      tickets_sma.each do |ticket|
        @ticket_all << ticket
      end
    end

    @tickets = @ticket_all.sort_by { |ticket| ticket.dreport.date }.reverse!

  end


  def history
    ticket = Ticket.find(params[:id])
    client = ticket.client
    tickets = Ticket
      .client(client)
      .limit(4)
      .concluded
    @tickets = tickets.sort_by { |ticket| ticket.dreport.date }.reverse!
  end

  def show
    @ticket = Ticket.find(params[:id])
    @jobs = @ticket.job_titles
    @items = @ticket.mat_items
    @qtys = @ticket.mat_qtys
    @measure_points = @ticket.meas_points
    @measure_logs = @ticket.meas_logs
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      @ticket.save
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params
      .require(:ticket)
      .permit(
        :dreport_id,
        :number,
        :client,
        :starts_at,
        :ends_at,
        :status,
        :kind,
        :observation,
        :job_1, :job_2, :job_3, :job_4, :job_5, :job_6,
        :mat_1, :mat_2, :mat_3, :mat_4, :mat_5, :mat_6,
        :nt, :sma
      )
    end
end
