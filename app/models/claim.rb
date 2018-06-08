class Claim < ApplicationRecord
  #relation n:m claims_users
  #has_and_belongs_to_many :users
  #relation n:m claims_teams
  has_and_belongs_to_many :teams

end
