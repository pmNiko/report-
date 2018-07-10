class AddTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :mat_qty_1, :integer
    add_column :tickets, :mat_qty_2, :integer
    add_column :tickets, :mat_qty_3, :integer
    add_column :tickets, :mat_qty_4, :integer
    add_column :tickets, :mat_qty_5, :integer
    add_column :tickets, :mat_qty_6, :integer

    add_column :tickets, :meas_p1, :integer
    add_column :tickets, :meas_p2, :integer
    add_column :tickets, :meas_p3, :integer
    add_column :tickets, :meas_p4, :integer
    add_column :tickets, :meas_p5, :integer
    add_column :tickets, :meas_p6, :integer

    add_column :tickets, :meas_log1, :text
    add_column :tickets, :meas_log2, :text
    add_column :tickets, :meas_log3, :text
    add_column :tickets, :meas_log4, :text
    add_column :tickets, :meas_log5, :text
    add_column :tickets, :meas_log6, :text

    rename_column :tickets, :mat_1, :mat_item1
    rename_column :tickets, :mat_2, :mat_item2
    rename_column :tickets, :mat_3, :mat_item3
    rename_column :tickets, :mat_4, :mat_item4
    rename_column :tickets, :mat_5, :mat_item5
    rename_column :tickets, :mat_6, :mat_item6
  end
end
