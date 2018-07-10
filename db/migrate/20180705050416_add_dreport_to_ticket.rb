class AddDreportToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :dreport, foreign_key: true
  end
end
