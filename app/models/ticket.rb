class Ticket < ApplicationRecord
  #relation 1:N  -  dreport tickets
  belongs_to :dreport
end
