class Ticket < ApplicationRecord

  #---------- Associations ----------#

  #relation 1:N  -  dreport tickets
  belongs_to :dreport

  #---------- Hash attribute´s ----------#

  enum status: {
    pendiente: 1, en_curso: 2, coordinado: 3, finalizado: 4,
    revisar: 5, contactar: 6, contactado: 7
  }
  enum kind: {
    Reclamo: 1, Instalacion: 2, Fibra: 3, Voip: 4, Wireless: 5,
    Cruzada: 6, Preventivo: 7, Relevamiento: 8,
    Extencion: 9, factibilidad: 10
  }


  #---------- Public Method´s ----------#

  # => returns true if your history is not empty
  def has_history?
    Ticket.client(client).any?
  end
  
  def item_key(item_param)
    Ticket.items[item_param]
  end

  # => return start hour claim
  def starts
    form_print(starts_at)
  end

  # => return end hour claim
  def ends
    form_print(ends_at)
  end

  # => return data from responsables
  def data_responsables
    dreport.data_responsables
  end

  # => return true if has a responsable
  def has_responsable?
    dreport.has_responsable?
  end

  # => date of ticket
  def date
    dreport.date_format
  end

  # => load a claim
  def load_parameters(claim)
    #load simple attributes
    self.number = claim.ticket
    self.client = claim.client
    self.status = claim.status_key
    self.starts_at = claim.starts_at
    self.ends_at = claim.ends_at
    self.kind = claim.kind_key
    self.author = claim.author.email
    self.observation = claim.observation

    # => load attribute collection <= #

    # => load jobs
    unless claim.jobs.nil?
      self.load_jobs(claim.jobs)
    end
    # => load materials
    unless claim.materials.nil?
      self.load_materials(claim.materials)
    end

    # => load measures
    unless claim.measures.nil?
      self.load_measures(claim.measures)
    end
    # => update to object
    save
  end

  def start
    starts_at.strftime("%R")
  end

  def end
  ends_at.strftime("%R")
  end

  def job_codes
    reject_nil(
      job_cod_1, job_cod_2, job_cod_3,
      job_cod_4, job_cod_5, job_cod_6
    )
  end

  def job_titles
    reject_nil(
      job_title_1, job_title_2, job_title_3,
      job_title_4, job_title_5, job_title_6
    )
  end

  def mat_items
    reject_nil(
      mat_item1, mat_item2, mat_item3,
      mat_item4, mat_item5, mat_item6
    )
  end

  def mat_qtys
    reject_nil(
      mat_qty_1, mat_qty_2, mat_qty_3,
      mat_qty_4, mat_qty_5, mat_qty_6
    )
  end

  def meas_points
    reject_nil(
      meas_p1, meas_p2, meas_p3,
      meas_p4, meas_p5, meas_p6
    )
  end

  def meas_logs
    reject_nil(
      meas_log1, meas_log2, meas_log3,
      meas_log4, meas_log5, meas_log6
    )
  end


  #---------- Private Method´s ----------#

  # => Return hour:minutes unless tree condition:
  # => 1.-> hour isn´t nil
  # => 2.-> claim not be pendiente
  # => 3.-> hour its different to hour default
  def form_print(a_time)
    return "#{hour(a_time)}"+" hs" unless a_time.nil? ||
      pendiente? || time_default?(a_time)
  end
  # => hour default for comparison
  def time_default?(a_time)
    default = Time.now.change({ hour: 23, min: 59})
    hour(default) == hour(a_time)
  end

  # => pretty print
  def hour(a_time)
    a_time.strftime("%R")
  end

  # => load jobs to ticket
  def load_jobs(jobs)
    j = 1
    jobs.each do |job|
      case j
      when 1
        self.job_cod_1 = job.code
        self.job_title_1 = job.title
      when 2
        self.job_cod_2 = job.code
        self.job_title_2 = job.title
      when 3
        self.job_cod_3 = job.code
        self.job_title_3 = job.title
      when 4
        self.job_cod_4 = job.code
        self.job_title_4 = job.title
      when 5
        self.job_cod_5 = job.code
        self.job_title_5 = job.title
      when 6
        self.job_cod_6 = job.code
        self.job_title_6 = job.title
      else
        #nothing
      end
      j += 1
    end
  end

  # => load materials to ticket
  def load_materials(materials)
    mt = 1
    materials.each do |material|
      case mt
      when 1
        self.mat_item1 = material.item_key.to_s + " - " + material.item
        self.mat_qty_1 = material.quantity
      when 2
        self.mat_item2 = material.item_key.to_s + " - " + material.item
        self.mat_qty_2 = material.quantity
      when 3
        self.mat_item3 = material.item_key.to_s + " - " + material.item
        self.mat_qty_3 = material.quantity
      when 4
        self.mat_item4 = material.item_key.to_s + " - " + material.item
        self.mat_qty_4 = material.quantity
      when 5
        self.mat_item5 = material.item_key.to_s + " - " + material.item
        self.mat_qty_5 = material.quantity
      when 6
        self.mat_item6 = material.item_key.to_s + " - " + material.item
        self.mat_qty_6 = material.quantity
      else
        #nothing
      end
      mt += 1
    end
  end

  # => load measures to ticket
  def load_measures(measures)
    ms = 1
    measures.each do |measure|
      case ms
      when 1
        self.meas_p1 = measure.point
        self.meas_log1 = measure.log
      when 2
        self.meas_p2 = measure.point
        self.meas_log2 = measure.log
      when 3
        self.meas_p3 = measure.point
        self.meas_log3 = measure.log
      when 4
        self.meas_p4 = measure.point
        self.meas_log4 = measure.log
      when 5
        self.meas_p5 = measure.point
        self.meas_log5 = measure.log
      when 6
        self.meas_p6 = measure.point
        self.meas_log6 = measure.log
      else
        #nothing
      end
      ms += 1
    end
  end

  # => association with dreport
  def dreport_association(a_dreport)
    self.dreport_id = a_dreport.id
    self.save!
  end

  #
  def reject_nil(parm1,parm2,parm3,parm4,parm5,parm6)
    #@not_nil = []
    @params = []
    @params << parm1
    @params << parm2
    @params << parm3
    @params << parm4
    @params << parm5
    @params << parm6

    @params.reject{ |parm| parm.nil? }
  end

  #---------- Class method ----------#

  #Items all
  def self.itemss
    items.keys
  end

  # => scope claims day finished
  scope :concluded, lambda { where("status > ?", 3) }
  scope :client, -> (client_param) { where('client = ?', client_param) }

end
