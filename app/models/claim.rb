class Claim < ApplicationRecord

  #---------- Validates ----------#

  validates :ticket, :client, :kind, presence: true

  #---------- Associations ----------#

  #relation 1:N  -  team claims
  belongs_to :team

  #relation 1:N  -  claim - materials
  has_many :materials
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

  #Relation m:n   <==== Revisar
  has_and_belongs_to_many :jobs

  #---------- Hash attribute´s ----------#
  
  enum status: {
                pendiente: 1,en_curso: 2,
                finalizado: 3,contactar: 4,revisar: 5
              }
  enum kind: {
              reclamo: 1, instalacion: 2,
              cruzada: 3, trabajo_preventivo: 4, relevamiento: 5
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

  #----------  --- Private Method´s  ---  ----------#

  #Return hour:minutes unless tree condition:
  #1.-> hour isn´t nil
  #2.-> claim not be pendiente
  #3.-> hour its different to hour default
  def form_print(a_time)
    return "#{hour(a_time)}"+" hs" unless a_time.nil? ||
      pendiente? || hour(a_time) == hour_default
  end

  #Hour default for comparison
  def hour_default
    default = Time.now.change({ hour: 23, min: 59})
    hour(default)
  end

  #Pretty print
  def hour(a_time)
    a_time.strftime("%R")
  end

  #Destroy all children team
  def destroy_and_child
    materials.each do |material|
      material.destroy
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
