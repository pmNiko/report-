class AddCreateAtAndUpdateAtToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :created_at, :datetime, null: false
    add_column :tickets, :updated_at, :datetime, null: false
  end
end
