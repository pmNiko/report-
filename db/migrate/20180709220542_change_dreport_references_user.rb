class ChangeDreportReferencesUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :dreports, :responsable_1
    remove_column :dreports, :responsable_2

    create_table :dreports_users, :id => false do |t|
      t.integer :dreport_id
      t.integer :user_id
    end
  end
end
