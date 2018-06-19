class RenameColumStateToClaims < ActiveRecord::Migration[5.2]
  def change
    rename_column :claims, :state, :status
  end
end
