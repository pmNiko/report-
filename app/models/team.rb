class Team < ApplicationRecord
  #relation n:m teams_users
  has_and_belongs_to_many :users
  #relation n:m claims_teams
  has_and_belongs_to_many :claims, inverse_of: :teams
  accepts_nested_attributes_for :claims, reject_if: :all_blank, allow_destroy: true

  #incluye este usuario en su coleccion de usuarios
  def responsibles
    users
  end
  def date_format
    date.strftime("%d/%m/%Y")
  end

end
