class ChangeMeasPointsToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :meas_p1
    remove_column :tickets, :meas_p2
    remove_column :tickets, :meas_p3
    remove_column :tickets, :meas_p4
    remove_column :tickets, :meas_p5
    remove_column :tickets, :meas_p6

    add_column :tickets, :meas_p1, :string
    add_column :tickets, :meas_p2, :string
    add_column :tickets, :meas_p3, :string
    add_column :tickets, :meas_p4, :string
    add_column :tickets, :meas_p5, :string
    add_column :tickets, :meas_p6, :string
  end
end
