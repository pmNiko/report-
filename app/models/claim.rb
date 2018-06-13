class Claim < ApplicationRecord
  #relation 1:N  -  team claims
  belongs_to :team
  #Claim state
  enum status: {pendiente: 1,en_curso: 2,finalizado: 3,contactar: 4,revisar: 5}

  public
    def fprint(a_time)
      default = Time.now.change({ hour: 0, min: 8})
      return a_time.strftime("%R")	unless
      a_time.nil? || a_time.strftime("%R") == default.strftime("%R")
    end
    def starts
      self.fprint(self.starts_at)
    end
    def ends
      self.fprint(self.ends_at)
    end

end
