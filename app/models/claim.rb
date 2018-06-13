class Claim < ApplicationRecord
  #relation 1:N  -  team claims
  belongs_to :team
  #Claim state
  enum status: {pendiente: 1,en_curso: 2,finalizado: 3,contactar: 4,revisar: 5}

  def fprint(a_time)
    time_hs = a_time.strftime("%R")
    default = (Time.now.change({ hour: 23, min: 59})).strftime("%R")
    return "#{time_hs}"+" hs" unless a_time.nil? || pendiente? || time_hs == default
  end
  def starts
    self.fprint(self.starts_at)
  end
  def ends
    self.fprint(self.ends_at)
  end

end
