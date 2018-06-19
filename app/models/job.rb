class Job < ApplicationRecord
  #---------- Associations ----------#

  #Relation m:n
  has_and_belongs_to_many :claims


end
