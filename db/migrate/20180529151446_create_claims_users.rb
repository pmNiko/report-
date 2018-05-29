class CreateClaimsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :claims_users do |t|
      t.integer :claim_id
      t.integer :user_id
    end
  end
end
