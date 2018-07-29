class RenamePriorityToClaims < ActiveRecord::Migration[5.2]
  def change
    rename_column :claims, :order_of_priority, :priority
  end
end
