class AddBrandToDreport < ActiveRecord::Migration[5.2]
  def change
    add_column :dreports, :brand, :string
  end
end
