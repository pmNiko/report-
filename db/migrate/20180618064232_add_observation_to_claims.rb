class AddObservationToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :observation, :text
  end
end
