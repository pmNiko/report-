class AddItemToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :item, :integer
  end
end
