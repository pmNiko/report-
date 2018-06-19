class Claim < ApplicationRecord

  #---------- Validates ----------#

  validates :ticket, :client, :kind, presence: true

  #---------- Associations ----------#

  #relation 1:N  -  author claims
  #- Note: If the relationship is called `user` no we would need to specify the class.
  belongs_to :author, class_name: "User"

  #relation 1:N  -  team claims
  belongs_to :team

  #relation 1:N  -  claim - materials
  has_many :materials
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

  #relation 1:N  -  claim - measures
  has_many :measures
  accepts_nested_attributes_for :measures, reject_if: :all_blank, allow_destroy: true

  #Relation m:n   <==== Revisar
  has_and_belongs_to_many :jobs

  #---------- Hash attribute´s ----------#

  enum status: {
                pendiente: 1,en_curso: 2,
                finalizado: 3,contactar: 4,revisar: 5
              }
  enum kind: {
              Reclamo: 1, Instalacion: 2, Fibra: 3, Voip: 4, Wireless: 5,
              Cruzada: 6, Preventivo: 7, Relevamiento: 8,
              Extencion: 9
            }

  #----------  --- Public Method´s  ---  ----------#

  #Return start hour claim
  def starts
    form_print(starts_at)
  end

  #Return end hour claim
  def ends
    form_print(ends_at)
  end

  #Change status and set current start time
  def begin
    en_curso!
    #To set is necesary "self"
    self.starts_at = DateTime.current
    save
  end

  def current_end_time
    self.ends_at = DateTime.current
    save
  end

  #----------  --- Private Method´s  ---  ----------#

  #Return hour:minutes unless tree condition:
  #1.-> hour isn´t nil
  #2.-> claim not be pendiente
  #3.-> hour its different to hour default
  def form_print(a_time)
    return "#{hour(a_time)}"+" hs" unless a_time.nil? ||
      pendiente? || time_default?(a_time)
  end

  #Hour default for comparison
  def time_default?(a_time)
    default = Time.now.change({ hour: 23, min: 59})
    hour(default) == hour(a_time)
  end

  #Pretty print
  def hour(a_time)
    a_time.strftime("%R")
  end

  #Destroy all children claim => materials - claim => measures
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

  #Status all
  def self.statusess
    statuses.keys
  end

  #Kind of claim. Kind all
  def self.kindss
    kinds.keys
  end

end
