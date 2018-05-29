class Claim < ApplicationRecord
  #The class Claim has many responsables
  has_and_belongs_to_many :users
  #Return the responsables
  def responsables
    users
  end
  #Return true or false if contain only one responsable
  def has_responsable?
    responsables.count == 1
  end

  #Reclamo pertenece a algun equipo
  def to_a?(team)
    team.there_any?(self)
  end
  #Se encarga de agregar un responsable a su coleccion.
  def add(responsable)
    users << responsable
  end
end
