class ChangeColumnUserAndAddColumnAuthorToTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :dreports, :user_1_id
    remove_column :dreports, :user_2_id

    add_column :dreports, :responsable_1, :string
    add_column :dreports, :responsable_2, :string

    add_column :tickets, :author, :string
  end
end
