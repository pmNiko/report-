class Truck < ApplicationRecord

  #---------- Associations ----------#

  #relation 1:N  -  truck teams
  has_many :teams

  
end
