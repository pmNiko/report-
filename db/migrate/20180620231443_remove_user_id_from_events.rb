class RemoveUserIdFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_index :events, :user_id
    remove_column :events, :user_id, :string
  end
end
