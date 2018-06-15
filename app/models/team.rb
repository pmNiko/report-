class Team < ApplicationRecord
  #relation n:m teams_users
  has_and_belongs_to_many :users
  #relation 1:N  -  team claims
  has_many :claims
  accepts_nested_attributes_for :claims, reject_if: :all_blank, allow_destroy: true
  #relation 1:N  -  truck teams
  belongs_to :truck


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
      claim.destroy_and_child
    end
    self.destroy
  end
  #Print percent advanced distinct [] or 0
  def percent_advanced
    advanced = self.claims.select{ |claim| !claim.pendiente? }
    return 0 unless !advanced.empty?
      return advanced.count * 100 / self.claims.count
  end
  # % of advance distinct 0 or 5% default
  def advanced
    advanced = percent_advanced
    return 5 unless !advanced == 0
      return advanced
  end
end
