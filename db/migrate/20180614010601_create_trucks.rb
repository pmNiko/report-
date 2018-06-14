class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.integer :number
      t.string :brand

      t.timestamps
    end
  end
end
