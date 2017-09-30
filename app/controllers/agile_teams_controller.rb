class AgileTeamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @agile_team = AgileTeam.find(params[:id]).decorate
    @score_cards = ScoreCardDecorator.decorate_collection(
      ScoreCard.where(agile_team: @agile_team).includes(:score_card_answers).includes(:questions).order(created_at: :desc)
    )
    @score_card = ScoreCard.new
    
    set_breadcrumbs
  end
  
  def health_progression
    @agile_team = AgileTeam.find(params[:id]).decorate
    score_cards = ScoreCard.where(agile_team: @agile_team).includes(:score_card_answers).includes(:questions).order(created_at: :desc).first(5)

    @report = Reports::AgileTeam.new(score_cards: score_cards)
    set_progression_breadcrumbs
  end
  
  private
  
  def set_breadcrumbs
    add_breadcrumb "Home", :root_path
    add_breadcrumb "#{@agile_team.name}", agile_team_path(@agile_team)
  end

  def set_progression_breadcrumbs
    add_breadcrumb "Home", :root_path
    add_breadcrumb "#{@agile_team.name}", agile_team_path(@agile_team)
    add_breadcrumb "Health Progression", health_progression_path(@agile_team)
  end
end
