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
    Ticket: 9,
  }

  # => color correspond to type event
  enum color_event_type: {
    1 => "rgb(42, 99, 41);",
    2 => "rgb(42, 99, 41);",
    3 => " rgba(95, 12, 12, 0.81); ",
    4 => "rgba(52, 50, 66, 0.9); ",
    5 => "rgba(52, 50, 66, 0.9); ",
    6 => "rgba(52, 50, 66, 0.9); ",
    7 => "rgba(105, 115, 115, 0.74);",
    8 => "rgba(105, 115, 115, 0.74);"
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
