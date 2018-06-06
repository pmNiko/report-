class Claim < ApplicationRecord
  #relation n:m claims_users
  has_and_belongs_to_many :users
  #relation n:m claims_teams
  has_and_belongs_to_many :teams

  #Return the responsables
  def responsables
    users
  end
  #Return true or false if contain only one responsable
  def has_responsable?
    responsables.count == 1
  end

end
