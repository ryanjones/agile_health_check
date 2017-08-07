class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @agile_teams = AgileTeamDecorator.decorate_collection(AgileTeam.all.includes(:score_cards))
    @score_cards = ScoreCardDecorator.decorate_collection(ScoreCard.includes(:agile_team).order(created_at: :desc).first(10))
  end
end
