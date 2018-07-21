class AddCloseToDreport < ActiveRecord::Migration[5.2]
  def change
    add_column :dreports, :close, :boolean, default: false
  end
end
