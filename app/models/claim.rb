class Claim < ApplicationRecord
  #relation n:m claims_users
  #has_and_belongs_to_many :users
  #relation n:m claims_teams
  has_and_belongs_to_many :teams
  #Claim state
  enum status: {
    pending: 1,
    in_progress: 2,
    finished: 3,
    to_contact: 4,
    review: 5
  }

end
