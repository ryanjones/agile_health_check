class ScoreCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_score_card, only: [:show, :edit, :update, :destroy]


  def create
    agile_team = AgileTeam.find(score_card_params[:agile_team_id])
    score_card = ScoreCard.create!(agile_team: agile_team)
    
    if agile_team.kind == "agile_team"
      Question.where.not(kind: Question.kinds[:product_owner_health_check]).all.each do |q|
        ScoreCardAnswer.create!(score_card: score_card, question: q)
      end
    end

    if agile_team.kind == "product_team"
      Question.where(kind: Question.kinds[:product_owner_health_check]).all.each do |q|
        ScoreCardAnswer.create!(score_card: score_card, question: q)
      end
    end
    
    redirect_to edit_score_card_path(score_card), notice: 'Health check created successfully.'
  end
  
  def show
    @score_card_answers = ScoreCardAnswer.includes(:question).where(score_card: @score_card).all
  end
  
  def edit
  end

  def update
    if @score_card.update(score_card_params)
      redirect_to @score_card, notice: 'Health check was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @score_card.destroy
    redirect_to root_path, notice: 'Health check deleted successfully.'
  end

  private
  
  def score_card_params
    params.require(:score_card).permit(:agile_team_id, score_card_answers_attributes: [:id, :score] )
  end

  def set_score_card
    @score_card = ScoreCard.find(params[:id])
  end

end


