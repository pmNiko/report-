class Team < ApplicationRecord
  #relation n:m teams_users
  has_and_belongs_to_many :users
  #relation n:m claims_teams
  has_and_belongs_to_many :claims, inverse_of: :teams
  accepts_nested_attributes_for :claims, reject_if: :all_blank, allow_destroy: true


  #incluye este usuario en su coleccion de usuarios
  def date_format
    date.strftime("%d/%m/%Y")
  end

  #Return the responsables
  def responsables
    users
  end
  #Return true or false if contain only one responsable
  def has_responsable?
    responsables.count == 1
  end
  #Destroy all children team
  def destroy_and_child
    self.claims.each do |claim|
      claim.destroy
    end
    self.destroy
  end
  # % of advance
  def advanced
    advanced = self.claims.select{ |claim| !claim.pendiente? }
    advanced.count * 100 / self.claims.count
  end
end
