class Job < ApplicationRecord
  #---------- Associations ----------#

  # => relation N:M
  has_and_belongs_to_many :claims


end
