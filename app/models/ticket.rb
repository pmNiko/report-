class Ticket < ApplicationRecord

  #---------- Associations ----------#

  #relation 1:N  -  dreport tickets
  belongs_to :dreport

  def load(claim)
    #load simple attributes
    self.number = claim.ticket
    self.client = claim.client
    self.starts_at = claim.starts_at
    self.ends_at = claim.ends_at
    self.kind = claim.kind
    self.observation = claim.observation

    # => load attribute collection <= #

    # => load jobs
    unless claim.jobs.nil?
      self.load_jobs(claim.jobs)

    # => load materials
    unless claim.materials.nil?
      self.load_jobs(claim.materials)
    end

    # => load measures
    unless claim.measures.nil?
      self.load_jobs(claim.measures)
    end

    # => insert to DB
    save!

  end

  def load_jobs(jobs)
    j = 1
    jobs.each do |job|
      case j
      when 1
        self.job_cod_1 = job.code
        self.job_title_1 = job_title
      when 2
        self.job_cod_2 = job.code
        self.job_title_2 = job_title
      when 3
        self.job_cod_3 = job.code
        self.job_title_3 = job_title
      when 4
        self.job_cod_4 = job.code
        self.job_title_4 = job_title
      when 5
        self.job_cod_5 = job.code
        self.job_title_5 = job_title
      when 6
        self.job_cod_6 = job.code
        self.job_title_6 = job_title
      else
        #nothing
      end
      j += 1
    end
  end

  def load_materials(materials)
    mt = 1
    materials.each do |maetrial|
      case mt
      when 1
        self.mat_item_1 = maetrial.item
        self.mat_qty_1 = maetrial.quantity
      when 2
        self.mat_item_2 = maetrial.item
        self.mat_qty_2 = maetrial.quantity
      when 3
        self.mat_item_3 = maetrial.item
        self.mat_qty_3 = maetrial.quantity
      when 4
        self.mat_item_4 = maetrial.item
        self.mat_qty_4 = maetrial.quantity
      when 5
        self.mat_item_5 = maetrial.item
        self.mat_qty_5 = maetrial.quantity
      when 6
        self.mat_item_6 = maetrial.item
        self.mat_qty_6 = maetrial.quantity
      else
        #nothing
      end
      mt += 1
    end
  end

  def load_measures(measures)
    ms = 1
    measures.each do |measure|
      case ms
      when 1
        self.meas_p1 = measure.point
        self.meas_log_1 = measure.log
      when 2
        self.meas_p2 = measure.point
        self.meas_log_2 = measure.log
      when 3
        self.meas_p3 = measure.point
        self.meas_log_3 = measure.log
      when 4
        self.meas_p4 = measure.point
        self.meas_log_4 = measure.log
      when 5
        self.meas_p5 = measure.point
        self.meas_log_5 = measure.log
      when 6
        self.meas_p6 = measure.point
        self.meas_log_6 = measure.log
      else
        #nothing
      end
      ms += 1
    end
  end

  def association(a_dreport)
    self.dreport_id = a_dreport.id
    save
  end

end
