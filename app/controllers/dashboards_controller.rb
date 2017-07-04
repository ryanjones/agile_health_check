class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @agile_teams = AgileTeam.all.includes(:score_cards)
    @score_cards = ScoreCard.includes(:agile_team).last(10)
  end
end
