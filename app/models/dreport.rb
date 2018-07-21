class Dreport < ApplicationRecord

  #---------- Associations ----------#

  # => relation 1:N  -  dreport tickets
  has_many :tickets

  # => relation n:m dreports_users
  has_and_belongs_to_many :users
  #---------- Public Method´s ----------#

  def to_close
    self.close = true
    save
  end
  
  # => return data from responsables
  def data_responsables
    data = []
    data << users.first.email
    unless has_responsable?
      data << users.second.email
    end
    return data
  end

  # => return true or false if contain only one responsable
  def has_responsable?
    users.count == 1
  end

  # => load a team parameters to dreport
  def load_parameters(team)
    self.date = team.date
    self.truck = team.truck.number
    self.brand = team.truck.brand
    self.add_responsables(team)

    claims = team.claims.concluded
    unless claims.nil?
      self.association_tickets(claims)
    end
    save
  end

  # => pretty print
  def date_format
    date.strftime("%d/%m/%Y")
  end

  #---------- Private Method´s ----------#

  # => load responsables to dreport
  def add_responsables(team)
    self.users << team.responsables.first
    unless team.has_responsable?
      self.users << team.responsables.second
    end
  end

  # => create and associated tickets
  def association_tickets(claims)
    claims.each do |claim|
      #create new ticket
      @ticket = Ticket.new
      #load simple attributes
      @ticket.load_parameters(claim)
      @ticket.dreport_association(self)
    end
  end

  # => scope teams today
  scope :today, lambda { where('date = ?', Date.today) }
end
