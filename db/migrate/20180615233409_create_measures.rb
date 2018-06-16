class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|
      t.integer :point
      t.text :log
      t.references :claim, foreign_key: true

      t.timestamps
    end
  end
end
