class AgileTeamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @agile_team = AgileTeam.find(params[:id])
    @score_cards = ScoreCard.where(agile_team: @agile_team).order(created_at: :desc)
    @score_card = ScoreCard.new
  end
end
