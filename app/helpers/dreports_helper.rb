module DreportsHelper
  def dreport_responsables(dreport)
    if dreport.users.second.nil?
      dreport.users.first.email
    else
      dreport.users.first.email + " - " + dreport.users.second.email
    end
  end

  def dreport_truck(dreport)
    dreport.brand + " Nº" + dreport.truck.to_s
  end
end
