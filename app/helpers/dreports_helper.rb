module DreportsHelper
  def dreport_responsables(dreport)
    if dreport.responsable_2.nil?
      dreport.responsable_1
    else
      dreport.responsable_1 + " - " + dreport.responsable_2
    end
  end

  def dreport_truck(dreport)
    dreport.brand + " Nº" + dreport.truck.to_s
  end
end
