class ChangeTypeDateToClaims < ActiveRecord::Migration[5.2]
  def change
    remove_column :claims, :starts_at
    remove_column :claims, :ends_at

    add_column :claims, :starts_at, :datetime
    add_column :claims, :ends_at, :datetime
  end
end
