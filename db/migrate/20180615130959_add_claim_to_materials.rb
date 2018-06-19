class AddClaimToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :claim, foreign_key: true
  end
end
