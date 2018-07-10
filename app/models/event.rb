class Event < ApplicationRecord

  #---------- Associations ----------#

  # => Relation N:M users - events
  has_and_belongs_to_many :users

  #---------- Hash attribute´s ----------#

  # => type event
  enum type_event: {
    Guardia: 1,
    Hs_Extras: 2,
    Parte_Medico: 3,
    Familiar: 4,
    Tramites: 5,
    Estudio: 6,
    Franco: 7,
    Vacaciones: 8,
  }

  # => color correspond to type event
  enum color_event_type: {
    1 => "#a0fd88",
    2 => "#e788ff",
    3 => "#8cbdff",
    4 => "#8cbdff",
    5 => "#a7cbff",
    6 => "#a7cbff",
    7 => "#a7cbff",
    8 => "#a7cbff"
  }
  

end

  #---------- Color References ----------#

  ## Type of Events
  #
  #--> #a0fd88
  #Franquero o guardia
  #
  #--> #e788ff
  #Extras
  #
  #--> #6eaaff
  #Enfermo (parte medico)
  #Familiar
  #
  #--> #a7cbff
  #Tramites
  #Estudio
  #
  #--> #dbebff
  #franco
  #Vacaciones
