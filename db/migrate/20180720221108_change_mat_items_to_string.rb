class ChangeMatItemsToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :mat_item1
    remove_column :tickets, :mat_item2
    remove_column :tickets, :mat_item3
    remove_column :tickets, :mat_item4
    remove_column :tickets, :mat_item5
    remove_column :tickets, :mat_item6

    add_column :tickets, :mat_item1, :string
    add_column :tickets, :mat_item2, :string
    add_column :tickets, :mat_item3, :string
    add_column :tickets, :mat_item4, :string
    add_column :tickets, :mat_item5, :string
    add_column :tickets, :mat_item6, :string
  end
end
