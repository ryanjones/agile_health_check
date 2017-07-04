class ScoreCardsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    score_card = ScoreCard.create(agile_team: AgileTeam.find(score_card_params[:agile_team_id]))
    
    # need to create and associated score card answers + questions
    
    redirect_to score_card_path(score_card), notice: 'Score card created successfully.'
  end
  
  def show
    @score_card = ScoreCard.includes(:questions).where(id: params[:id])
  end

  private
    def score_card_params
      params.require(:score_card).permit(:agile_team_id)
    end
end


