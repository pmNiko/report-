class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :star_time
      t.datetime :end_time
      t.integer :type_event
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
