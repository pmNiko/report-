class RenameColumnJobToTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :job_1, :job_cod_1
    rename_column :tickets, :job_2, :job_cod_2
    rename_column :tickets, :job_3, :job_cod_3
    rename_column :tickets, :job_4, :job_cod_4
    rename_column :tickets, :job_5, :job_cod_5
    rename_column :tickets, :job_6, :job_cod_6

    add_column :tickets, :job_title_1, :string
    add_column :tickets, :job_title_2, :string
    add_column :tickets, :job_title_3, :string
    add_column :tickets, :job_title_4, :string
    add_column :tickets, :job_title_5, :string
    add_column :tickets, :job_title_6, :string
  end
end
