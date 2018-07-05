class Dreport < ApplicationRecord
  
  #relation 1:N user_1/user_2 dreports
  belongs_to :user_1, class_name: "User"
  belongs_to :user_2, class_name: "User"

  #relation 1:N  -  dreport tickets
  has_many :tickets
end
