class Truck < ApplicationRecord
  #relation 1:N  -  truck teams
  has_many :teams
end
