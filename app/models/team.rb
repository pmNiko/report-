class Team < ApplicationRecord

  #---------- Validates ----------#

  # => Validates attributes
  validates :date, presence: true

  # => Validates of associations
  validates_presence_of :truck, :users, presence: true

  #---------- Associations ----------#

  # => relation n:m teams_users
  has_and_belongs_to_many :users

  # => relation 1:N  -  team claims
  has_many :claims
  accepts_nested_attributes_for :claims, reject_if: :all_blank, allow_destroy: true

  # => relation 1:N  -  truck teams
  belongs_to :truck

  #----------  --- Public Method´s  ---  ----------#

  # => return true if not empty
  def working?
    !claims.working.empty?
  end

  # => return collection of claims working to order for priority ASC
  def claims_order_working
    claims.working.order( 'priority ASC' )
  end

  # => return collection of claims pending to order for starts_at ASC
  def claims_order_pending
    claims.pending.order( 'starts_at ASC' )
  end

  # => return collection of claims concluded to order for priority ASC
  def claims_order_concluded
    claims.concluded.order( 'priority ASC' )
  end

  # => insert priority to claims collection
  def give_priority
    order = 1
    claims.each do |claim|
      claim.priority = order
      order += 1
      claim.save
    end
  end

  # => Association author to claims
  def add_authors(current_user)
    claims.each do |claim|
      if claim.author.nil?
        claim.author = current_user
        save
      end
    end
  end

  # => return the responsables
  def responsables
    users
  end

  # => return data from responsables
  def data_responsables
    data = []
    data << responsables.first.email
    unless has_responsable?
      data << responsables.second.email
    end
    return data
  end

  # => return true or false if contain only one responsable
  def has_responsable?
    responsables.count == 1
  end

  # => percent advance, default 0%
  def percent
    advanced(0)
  end

  # => percent advance, default 5%
  def progress_bar
    advanced(5)
  end


  #----------  --- Private Method´s  ---  ----------#

  # => print percent advanced, distinct [] or 0
  def advanced(val_default)
    advanced = self.concluded
    return val_default if advanced.empty?
    return advanced.count * 100 / self.claims.count
  end

  # => pretty print
  def date_format
    date.strftime("%d/%m/%Y")
  end

  # => destroy all children team
  def destroy_and_child
    self.claims.each do |claim|
      claim.destroy_and_child
    end
    self.destroy
  end

  # => claims finished or concluded
  def concluded
    claims.select { |claim| !claim.pendiente?}
  end

  def finalize
    self.finished = true
    save
  end
  def finished?
    finished == true
  end
  #----------  --- Private Method´s  ---  ----------#

  # => scope teams today
  scope :today, lambda { where('date = ?', Date.today) }

  # => scope teams day finished
  scope :finished, lambda { where(finished: true) }


end
