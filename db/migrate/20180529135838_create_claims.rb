class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer :ticket
      t.string :client

      t.timestamps
    end
  end
end
