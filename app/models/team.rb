class Team < ApplicationRecord

  #---------- Validates ----------#

  #Validates attributes
  validates :date, presence: true

  #Validates of associations
  validates_presence_of :truck, :users, presence: true

  #---------- Associations ----------#

  #relation n:m teams_users
  has_and_belongs_to_many :users

  #relation 1:N  -  team claims
  has_many :claims
  accepts_nested_attributes_for :claims, reject_if: :all_blank, allow_destroy: true

  #relation 1:N  -  truck teams
  belongs_to :truck

  #----------  --- Public Method´s  ---  ----------#

  def add_authors(current_user)
    claims.each do |claim|
      claim.author = current_user
    end
  end

  #Return the responsables
  def responsables
    users
  end

  #Return true or false if contain only one responsable
  def has_responsable?
    responsables.count == 1
  end

  #% of advance default 0%
  def percent
    advanced(0)
  end

  # % of advance default 5%
  def progress_bar
    advanced(5)
  end


  #----------  --- Private Method´s  ---  ----------#

  #Print percent advanced distinct [] or 0
  def advanced(val_default)
    advanced = self.claims.select{ |claim| !claim.pendiente? }
    return val_default if advanced.empty?
    return advanced.count * 100 / self.claims.count
  end

  #Pretty print
  def date_format
    date.strftime("%d/%m/%Y")
  end

  #Destroy all children team
  def destroy_and_child
    self.claims.each do |claim|
      claim.destroy_and_child
    end
    self.destroy
  end


end
