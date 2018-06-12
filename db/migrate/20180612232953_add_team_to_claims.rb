class AddTeamToClaims < ActiveRecord::Migration[5.2]
  def change
    add_reference :claims, :team, foreign_key: true
  end
end
