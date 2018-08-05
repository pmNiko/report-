class Dreport < ApplicationRecord

  #---------- Associations ----------#

  # => relation 1:N  -  dreport tickets
  has_many :tickets

  # => relation n:m dreports_users
  has_and_belongs_to_many :users

  #---------- Public Method´s ----------#

  # => return collection of tickets order to starts_at ASC
  def tickets_order_start_at
    tickets.order( 'starts_at ASC' )
  end

  # => return true if self closed
  def closed?
    closed == true
  end

  # => change status to closed true
  def to_close
    self.closed = true
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

  # => scope dreport today
  scope :today, lambda { where('date = ?', Date.today) }
  # => scope dreport today
  scope :date, -> (date_param) { where('date = ?', date_param) }
end
