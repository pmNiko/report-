class Ticket < ApplicationRecord

  #---------- Associations ----------#

  #relation 1:N  -  dreport tickets
  belongs_to :dreport

  #---------- Hash attribute´s ----------#

  enum status: {
    pendiente: 1,en_curso: 2,finalizado: 3,
    contactar: 4,revisar: 5,coordinado: 6, contactado: 7
  }
  enum kind: {
    Reclamo: 1, Instalacion: 2, Fibra: 3, Voip: 4, Wireless: 5,
    Cruzada: 6, Preventivo: 7, Relevamiento: 8,
    Extencion: 9
  }
  # => item
  enum item: {
    "BAJADA UN PAR": 5,
    "JACK AMER. EMBUT.": 307,    "JACK AMER. EXTER.": 308,
    "SPLITTER": 6,               "FILTRO ADSL": 7,
    "APARATO TELEF.": 417,       "MODEM": 418,
    "CABLE 2P AUTOPORT": 1,      "CABLE 4P AUTOPORT": 3,
    "CABLE 2P C/GEL": 2,         "CABLE 4P C/GEL": 4,
    "CAJA INTERC. 1P": 185,      "CAJA INTERC. 2P": 186,
    "ANILLA 15mm": 147,          "ANILLA 32mm": 148,
    "CABLE INTERNO": 11,         "CADENA POSTE": 172
  }
  # => point
  enum point: {
    Central: 1, Primario: 2, Secundario: 3,
    Bajada: 4, Domicilio: 5
  }

  #---------- Public Method´s ----------#

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
    materials.each do |maetrial|
      case mt
      when 1
        self.mat_item1 = maetrial.item_key
        self.mat_qty_1 = maetrial.quantity
      when 2
        self.mat_item2 = maetrial.item_key
        self.mat_qty_2 = maetrial.quantity
      when 3
        self.mat_item3 = maetrial.item_key
        self.mat_qty_3 = maetrial.quantity
      when 4
        self.mat_item4 = maetrial.item_key
        self.mat_qty_4 = maetrial.quantity
      when 5
        self.mat_item5 = maetrial.item_key
        self.mat_qty_5 = maetrial.quantity
      when 6
        self.mat_item6 = maetrial.item_key
        self.mat_qty_6 = maetrial.quantity
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
        self.meas_p1 = measure.point_key
        self.meas_log1 = measure.log
      when 2
        self.meas_p2 = measure.point_key
        self.meas_log2 = measure.log
      when 3
        self.meas_p3 = measure.point_key
        self.meas_log3 = measure.log
      when 4
        self.meas_p4 = measure.point_key
        self.meas_log4 = measure.log
      when 5
        self.meas_p5 = measure.point_key
        self.meas_log5 = measure.log
      when 6
        self.meas_p6 = measure.point_key
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

end
