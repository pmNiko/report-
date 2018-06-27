# app/helpers/roles_helper.rb
module ClaimsHelper
  #Return true when claim concluded
  def concluded?(claim)
    claim.finalizado? || claim.contactar? || claim.revisar?
  end

  #Responsable email
  def claim_resposables(claim)
    if claim.has_responsable?
      claim.data_responsables.first
    else
      claim.data_responsables.first + " " + claim.data_responsables.second
    end
  end
end
