# app/helpers/ticketss_helper.rb
module TicketsHelper
  #Responsable email
  def ticket_resposables(ticket)
    if ticket.has_responsable?
      ticket.data_responsables.first
    else
      ticket.data_responsables.first + " - " + ticket.data_responsables.second
    end
  end
end
