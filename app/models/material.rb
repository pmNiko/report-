class Material < ApplicationRecord

  #---------- Validates attributes ----------#

  validates :quantity, presence: true

  #---------- Associations ----------#

  #Relation 1:N claim - materials
  belongs_to :claim

  #---------- Hash attribute ----------#

  # => item
  enum item: {
    "CABLE 2P AUTOPORT": 1, "CABLE 2P C/GEL": 2, "CABLE 4P AUTOPORT": 3, "CABLE 4P C/GEL": 4,
    "BAJADA UN PAR": 5, "SPLITTER": 6, "FILTRO ADSL": 7, "CABLE INTERNO": 11, "ANILLA 15mm": 147,
    "ANILLA 32mm": 148, "CADENA POSTE": 172, "CAJA INTERC. 1P": 185, "CAJA INTERC. 2P": 186,
    "JACK AMER. EMBUT.": 307, "JACK AMER. EXTER.": 308, "APARATO TELEF.": 417, "MODEM": 418 }

  #---------- Public method´s ----------#

  def item_key
    Material.items[self.item]
  end

  #---------- Class method ----------#

  #Items all
  def self.itemss
    items.keys
  end


end
