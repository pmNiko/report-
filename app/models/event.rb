class Event < ApplicationRecord

  #---------- Associations ----------#

  #Relation 1:N user - events
  belongs_to :user

  
end
