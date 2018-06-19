class Event < ApplicationRecord
  belongs_to :user

  enum type_events: {
    Guardia: 1,
    Hs_Extras: 2,
    Parte_Medico: 3,
    Familiar: 4,
    Tramites: 5,
    Estudio: 6,
    Franco: 7,
    Vacaciones: 8,
  }

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
