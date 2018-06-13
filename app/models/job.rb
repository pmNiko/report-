class Job < ApplicationRecord
  #Relation m:n 
  has_and_belongs_to_many :claims
end
