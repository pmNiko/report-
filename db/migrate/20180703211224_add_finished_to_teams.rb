class AddFinishedToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :finished, :boolean, default: false
  end
end
