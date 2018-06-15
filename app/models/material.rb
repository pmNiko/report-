class Material < ApplicationRecord
  validates_presence_of :item, :quantity
  #Relation 1:N claim - materials
  belongs_to :claim

  enum item: {
              "JACK AMER. EMBUT.": 307,
              "JACK AMER. EXTER.": 308,
              "SPLITTER": 6,
              "FILTRO ADSL": 7,
              "BAJADA UN PAR": 5,
              "APARATO TELEF.": 417,
              "MODEM": 418,
              "CABLE 2P AUTOPORT": 1,
              "CABLE 2P C/GEL": 2,
              "CABLE 4P AUTOPORT": 3,
              "CABLE 4P C/GEL": 4,
              "CAJA INTERC. 1P": 185,
              "CAJA INTERC. 2P": 186,
              "ANILLA 15mm": 147,
              "ANILLA 32mm": 148,
              "CABLE INTERNO": 11,
              "CADENA POSTE": 172
            }
  def self.itemss
    items.keys
  end
end
