class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @agile_teams = AgileTeam.all.includes(:score_cards)
    @score_cards = ScoreCard.includes(:agile_team).order(created_at: :desc).first(10)
  end
end
