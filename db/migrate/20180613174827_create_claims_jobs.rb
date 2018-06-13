class CreateClaimsJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :claims_jobs do |t|
      t.integer :claim_id
      t.integer :job_id
    end
  end
end
