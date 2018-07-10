class Measure < ApplicationRecord

  #---------- Validates attributes ----------#

  validates :log, presence: true

  #---------- Associations ----------#

  #Relation 1:N claim - measures
  belongs_to :claim

  #---------- Hash attribute ----------#

  # => point
  enum point: {
              Central: 1, Primario: 2, Secundario: 3,
              Bajada: 4, Domicilio: 5
            }

  #---------- Public method´s ----------#

  def point_key
    Measure.points[self.point]
  end

  #---------- Class method ----------#

  #Points all
  def self.pointss
    points.keys
  end


end
