class Claim < ApplicationRecord
  #relation 1:N  -  team claims
  belongs_to :team
  #relation 1:N  -  claim - materials
  has_many :materials
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true
  #Relation m:n   <==== Revisar
  has_and_belongs_to_many :jobs
  #Claim state
  enum status: {pendiente: 1,en_curso: 2,finalizado: 3,contactar: 4,revisar: 5}
  enum kind: {reclamo: 1, instalacion: 2, cruzada: 3, trabajo_preventivo: 4, relevamiento: 5}

  #class method
  def self.statusess
    statuses.keys
  end
  def self.kindss
    kinds.keys
  end

  def fprint(a_time)
    default = Time.now.change({ hour: 23, min: 59})
    return "#{a_time.strftime("%R")}"+" hs" unless a_time.nil? || pendiente? ||
                                a_time.strftime("%R") == default.strftime("%R")
  end
  def starts
    self.fprint(self.starts_at)
  end
  def ends
    self.fprint(self.ends_at)
  end
  #Destroy all children team
  def destroy_and_child
    self.materials.each do |material|
      material.destroy
    end
    self.destroy
  end

end
