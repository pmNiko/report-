class RenameCloseToDreport < ActiveRecord::Migration[5.2]
  def change
    rename_column :dreports, :close, :closed
  end
end
