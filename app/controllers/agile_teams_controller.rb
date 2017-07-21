class AgileTeamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @agile_team = AgileTeam.find(params[:id])
    @score_cards = ScoreCard.where(agile_team: @agile_team).order(created_at: :desc)
    @score_card = ScoreCard.new
    
    set_breadcrumbs
  end
  
  private
  
  def set_breadcrumbs
    add_breadcrumb "Home", :root_path
    add_breadcrumb "#{@agile_team.name}", agile_team_path(@agile_team)
  end
end
