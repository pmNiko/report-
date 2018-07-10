class CreateDreports < ActiveRecord::Migration[5.2]
  def change
    create_table :dreports do |t|
      t.date :date
      t.integer :truck
      t.references :user_1, index: true
      t.references :user_2, index: true

      t.timestamps
    end
  end
end
