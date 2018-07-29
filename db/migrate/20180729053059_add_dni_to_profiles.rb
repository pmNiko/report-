class AddDniToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :dni, :string
    add_column :profiles, :vehicle_key, :string
  end
end
