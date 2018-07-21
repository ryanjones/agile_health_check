class Api::StatsController < ApplicationController
  def agile_teams
    @agile_teams = AgileTeam.all
  end
end
