class AddOrderToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :order_of_priority, :integer
  end
end
