class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :number
      t.string :client
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :kind
      t.float :job_1
      t.float :job_2
      t.float :job_3
      t.float :job_4
      t.float :job_5
      t.float :job_6
      t.integer :mat_1
      t.integer :mat_2
      t.integer :mat_3
      t.integer :mat_4
      t.integer :mat_5
      t.integer :mat_6
      t.text :observation
    end
  end
end
