class Claim < ApplicationRecord
  #relation 1:N  -  team claims
  belongs_to :team
  #Relation m:n
  has_and_belongs_to_many :jobs
  #Claim state
  enum status: {pendiente: 1,en_curso: 2,finalizado: 3,contactar: 4,revisar: 5}

  def fprint(a_time)
    default = Time.now.change({ hour: 23, min: 59})
    return "#{a_time.strftime("%R")}"+" hs" unless a_time.nil? || pendiente? ||
                                a_time.strftime("%R") == default.strftime("%R")
  end
  def starts
    self.fprint(self.starts_at)
  end
  def ends
    self.fprint(self.ends_at)
  end

end
