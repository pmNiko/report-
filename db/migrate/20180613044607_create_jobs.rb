class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.float :code
      t.string :title

      t.timestamps
    end
  end
end
