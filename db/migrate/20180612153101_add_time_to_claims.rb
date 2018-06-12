class AddTimeToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :starts_at, :time
    add_column :claims, :ends_at, :time
  end
end
