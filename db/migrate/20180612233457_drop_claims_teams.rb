class DropClaimsTeams < ActiveRecord::Migration[5.2]
  Claim.destroy_all
  Team.destroy_all
  def change
    drop_table :claims_teams
  end
end
