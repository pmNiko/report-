class DropClaimsUsers < ActiveRecord::Migration[5.2]
  Claim.destroy_all
  def change
    drop_table :claims_users
  end
end
