class ChangeTypeKindAndAddStatusToTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :kind

    add_column :tickets, :kind, :integer
    add_column :tickets, :status, :integer
  end
end
