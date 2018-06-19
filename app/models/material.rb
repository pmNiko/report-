class Material < ApplicationRecord

  #---------- Validates attributes ----------#

  validates :quantity, presence: true

  #---------- Associations ----------#

  #Relation 1:N claim - materials
  belongs_to :claim

  #---------- Hash attribute ----------#

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

  #---------- Class method ----------#
  
  #Items all
  def self.itemss
    items.keys
  end


end
