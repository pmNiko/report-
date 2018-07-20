class Claim < ApplicationRecord

  #---------- Validates ----------#

  validates :ticket, :client, :kind, presence: true

  #---------- Associations ----------#

  # => relation 1:N report - tickets
  #has_many :dreport_tickets
  #has_many :dreport, :through => :dreport_tickets

  # => relation 1:N  -  author claims
  #- Note: If the relationship is called `user` no we would need to specify the class.
  belongs_to :author, class_name: "User"

  # => relation 1:N  -  team claims
  belongs_to :team

  # => relation 1:N  -  claim - materials
  has_many :materials
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

  # => relation 1:N  -  claim - measures
  has_many :measures
  accepts_nested_attributes_for :measures, reject_if: :all_blank, allow_destroy: true

  # => relation m:n   <==== Revisar
  has_and_belongs_to_many :jobs

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

  #----------  --- Public Method´s  ---  ----------#

  # => change state and create new claim with set starts_at
  def to_coordinate(claim, team, hour, min, current_user)
    self.contactado!
    claim.author = current_user
    claim.team = team
    hour_coordinated = Time.now.change({ hour: "#{hour}", min: "#{min}"})
    claim.starts_at = hour_coordinated
    claim.ticket = self.ticket
    claim.client = self.client
    claim.coordinado!
    claim.kind = self.kind_key
    claim.observation = "<< Previo: " + "#{self.observation} >>"
    claim.save!
  end

  # => returns true if your history is not empty
  def has_history?
    Ticket.client(client).any?
  end

  #return status key
  def status_key
    Claim.statuses[self.status]
  end

  # => return kind key
  def kind_key
    Claim.kinds[self.kind]
  end

  # => return date to visit
  def date
    team.date_format
  end

  # => return data responsables claim
  def data_responsables
    team.data_responsables
  end

  # => return true if has a responsable
  def has_responsable?
    team.has_responsable?
  end

  # => return start hour claim
  def starts
    form_print(starts_at)
  end

  # => return end hour claim
  def ends
    form_print(ends_at)
  end

  # => change status and set current start time
  def begin
    en_curso!
    #To set is necesary "self"
    self.starts_at = DateTime.current
    save
  end

  # => set ends_at claim with current date
  def current_end_time
    self.ends_at = DateTime.current
    save
  end

  #----------  --- Private Method´s  ---  ----------#

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

  # => destroy all children claim => materials - claim => measures
  def destroy_and_child
    materials.each do |material|
      material.destroy
    end
    measures.each do |measure|
      measure.destroy
    end
    destroy
  end


  #---------- Class method´s ----------#

  # => all status
  def self.statusess
    statuses.keys
  end

  # => all kind
  def self.kindss
    kinds.keys
  end

  # => scope claims day finished
  scope :concluded, lambda { where("status > ?", 3) }
end
