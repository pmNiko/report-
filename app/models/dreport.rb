class Dreport < ApplicationRecord

  #---------- Associations ----------#

  # => relation 1:N user_1/user_2 dreports
  belongs_to :user_1, class_name: "User"
  belongs_to :user_2, class_name: "User"

  # => relation 1:N  -  dreport tickets
  has_many :tickets

  #---------- Public Method´s ----------#

  def load(team)
    self.date = team.date
    self.truck = team.truck
    self.add_responsables(team)

    claims = team.claims.finished
    unless claims.nil?
      self.association_tickets(claims)
    end
    save!
  end

  def add_responsables(team)
    self.user_1 = team.responsables.first
    unless team.has_responsable?
      self.user_2 = team.responsables.second
  end

  def association_tickets(claims)
    claims.each do |claim|
      #create new ticket
      @ticket = Ticket.new
      #load simple attributes
      @ticket.load(claim)
      #association
      @ticket.association(self)
    end
  end

end
