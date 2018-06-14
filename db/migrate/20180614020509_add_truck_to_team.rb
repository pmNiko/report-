class AddTruckToTeam < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :truck, foreign_key: true
  end
end
