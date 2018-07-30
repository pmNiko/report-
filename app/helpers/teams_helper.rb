module TeamsHelper
  def team_responsables(team)
    if team.has_responsable?
      team.data_responsables.first
    else
      team.data_responsables.first + "  " + team.data_responsables.second
    end
  end

  def team_truck(team)
    team.truck.brand + " Nº" + team.truck.number.to_s
  end
end
